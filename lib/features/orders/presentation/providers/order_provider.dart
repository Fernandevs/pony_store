import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pony_store/features/auth/presentation/providers/auth_provider.dart';
import 'package:pony_store/features/orders/domain/entities/order.dart';
import 'package:pony_store/features/orders/domain/repositories/orders_repository.dart';
import 'package:pony_store/features/orders/infrastructure/datasources/orders_datasource_impl.dart';
import 'package:pony_store/features/orders/infrastructure/repositories/orders_repository_impl.dart';

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  final token = ref.watch(authProvider).user?.token ?? '';

  final orderRepository = OrdersRepositoryImpl(
    OrdersDatasourceImpl(token: token),
  );

  return orderRepository;
});


final ordersProvider = StateNotifierProvider<ProductsNotifier, OrderState>((ref) {
  final repository = ref.watch(ordersRepositoryProvider);
  return ProductsNotifier(repository: repository);
});

class ProductsNotifier extends StateNotifier<OrderState> {
  final OrdersRepository repository;

  ProductsNotifier({
    required this.repository,
  }) : super(OrderState()) {
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true);

    final orders = await repository.findAll(
      limit: state.limit,
      offset: state.offset,
    );

    if (orders.isEmpty) {
      state = state.copyWith(isLoading: false, isLastPage: true);
      return;
    }

    state = state.copyWith(
      isLastPage: false,
      isLoading: false,
      offset: state.offset + 10,
      orders: [...state.orders, ...orders],
    );
  }
}

class OrderState {
  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;
  final List<Order> orders;

  OrderState({
    this.isLastPage = false,
    this.limit = 10,
    this.offset = 0,
    this.isLoading = false,
    this.orders = const [],
  });

  OrderState copyWith({
    bool? isLastPage,
    int? limit,
    int? offset,
    bool? isLoading,
    List<Order>? orders,
  }) =>
      OrderState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        isLoading: isLoading ?? this.isLoading,
        orders: orders ?? this.orders,
      );
}
