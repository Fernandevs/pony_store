import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';
import 'package:pony_store/features/products/domain/repositories/order_repository.dart';
import 'package:pony_store/features/products/presentation/providers/order_repository_provider.dart';

final shoppingCartProvider =
    StateNotifierProvider<ShoppingCartNotifier, ShoppingCartState>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return ShoppingCartNotifier(repository: repository);
});

class ShoppingCartNotifier extends StateNotifier<ShoppingCartState> {
  final OrderRepository repository;

  ShoppingCartNotifier({
    required this.repository,
  }) : super(ShoppingCartState());

  addProduct(Product product) => state = state.copyWith(
        amount: state.amount + product.price,
        products: [...state.products, product],
      );

  removeProduct(Product product) => state = state.copyWith(
        amount: state.amount - product.price,
        products: state.products
            .where((element) => element.id != product.id)
            .toList(),
      );

  checkout() async {
    final id = repository.order(amount: state.amount, items: state.products);
    state = state.copyWith(products: [], amount: 0);

    return id;
  }
}

class ShoppingCartState {
  final List<Product> products;
  double amount;

  ShoppingCartState({this.products = const [], this.amount = 0});

  ShoppingCartState copyWith({
    List<Product>? products,
    double? amount,
  }) =>
      ShoppingCartState(
        products: products ?? this.products,
        amount: amount ?? this.amount,
      );
}
