import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pony_store/features/products/domain/entities/product.dart';
import 'package:pony_store/features/products/domain/repositories/products_repository.dart';
import 'package:pony_store/features/products/presentation/presentation.dart';

final productProvider = StateNotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>((ref, id) {
  final repository = ref.watch(productsRepositoryProvider);
  return ProductNotifier(repository: repository, id: id);
});

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository repository;

  ProductNotifier({
    required this.repository,
    required String id,
  }) : super(ProductState(id: id)) {
    loadProduct();
  }

  Product newEmptyProduct() => const Product(
        id: 'new',
        name: '',
        description: '',
        price: 0,
        category: '',
        images: <String>[],
      );

  Future<void> loadProduct() async {
    try {
      if (state.id == 'new') {
        state = state.copyWith(
          isLoading: false,
          product: newEmptyProduct(),
        );
      }

      final product = await repository.getProductById(state.id);

      state = state.copyWith(
        isLoading: false,
        product: product,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
    }
  }
}

class ProductState {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState({
    required this.id,
    this.product,
    this.isLoading = true,
    this.isSaving = false,
  });

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) =>
      ProductState(
        id: id ?? this.id,
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );

  @override
  String toString() {
    return """ProductState: {
  id: $id,
  product: $product,
  isLoading: $isLoading,
  isSaving: $isSaving,
}
    """;
  }
}
