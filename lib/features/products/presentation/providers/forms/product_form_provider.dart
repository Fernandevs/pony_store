import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import 'package:pony_store/config/constants/environment.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';
import 'package:pony_store/features/products/presentation/providers/providers.dart';
import 'package:pony_store/features/shared/shared.dart';

final productFormProvider = StateNotifierProvider.autoDispose
    .family<ProductFormNotifier, ProductFormState, Product>((ref, product) {
  final createUpdateCallback =
      ref.watch(productsProvider.notifier).createOrUpdateProduct;

  return ProductFormNotifier(
    product: product,
    onSubmitCallback: createUpdateCallback,
  );
});

class ProductFormNotifier extends StateNotifier<ProductFormState> {
  final Future<bool> Function(Map<String, dynamic> productLike)?
      onSubmitCallback;

  ProductFormNotifier({
    this.onSubmitCallback,
    required Product product,
  }) : super(
          ProductFormState(
            id: product.id,
            title: Name.dirty(product.name),
            price: Price.dirty(product.price),
            description: product.description,
            images: product.images,
          ),
        );

  Future<bool> onFormSubmit() async {
    _touchedEverything();
    if (!state.isFormValid) return false;

    if (onSubmitCallback == null) return false;

    final productLike = {
      'id': state.id == 'new' ? null : state.id,
      'title': state.title.value,
      'price': state.price.value,
      'description': state.description,
      'sizes': state.sizes,
      'images': state.images
          .map(
            (image) =>
                image.replaceAll('${Environment.apiUrl}/files/product/', ''),
          )
          .toList()
    };

    try {
      return await onSubmitCallback!(productLike);
    } catch (e) {
      return false;
    }
  }

  void _touchedEverything() {
    state = state.copyWith(
      isFormValid: Formz.validate([
        Name.dirty(state.title.value),
        Price.dirty(state.price.value),
      ]),
    );
  }

  void updateProductImage(String path) {
    state = state.copyWith(
      images: [...state.images, path],
    );
  }

  void onTitleChanged(String value) {
    state = state.copyWith(
      title: Name.dirty(value),
      isFormValid: Formz.validate([
        Name.dirty(value),
        Price.dirty(state.price.value),
      ]),
    );
  }

  void onSlugChanged(String value) {
    state = state.copyWith(
      slug: Slug.dirty(value),
      isFormValid: Formz.validate([
        Name.dirty(state.title.value),
        Slug.dirty(value),
        Price.dirty(state.price.value),
      ]),
    );
  }

  void onPriceChanged(double value) {
    state = state.copyWith(
      price: Price.dirty(value),
      isFormValid: Formz.validate([
        Name.dirty(state.title.value),
        Price.dirty(value),
      ]),
    );
  }

  void onStockChanged(int value) {
    state = state.copyWith(
      inStock: Stock.dirty(value),
      isFormValid: Formz.validate([
        Name.dirty(state.title.value),
        Price.dirty(state.price.value),
        Stock.dirty(value),
      ]),
    );
  }

  void onSizeChanged(List<String> sizes) => state = state.copyWith(
        sizes: sizes,
      );

  void onGenderChanged(String gender) => state = state.copyWith(
        gender: gender,
      );

  void onDescriptionChanged(String description) => state = state.copyWith(
        description: description,
      );

  void onTagsChanged(String tags) => state = state.copyWith(
        tags: tags,
      );
}

class ProductFormState {
  final String? id;
  final bool isFormValid;
  final Name title;
  final Price price;
  final List<String> sizes;
  final String description;
  final List<String> images;

  ProductFormState({
    this.isFormValid = false,
    this.id,
    this.title = const Name.dirty(''),
    this.price = const Price.dirty(0),
    this.sizes = const [],
    this.description = '',
    this.images = const [],
  });

  ProductFormState copyWith({
    bool? isFormValid,
    String? id,
    Name? title,
    Slug? slug,
    Price? price,
    List<String>? sizes,
    String? gender,
    Stock? inStock,
    String? description,
    String? tags,
    List<String>? images,
  }) =>
      ProductFormState(
        isFormValid: isFormValid ?? this.isFormValid,
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        sizes: sizes ?? this.sizes,
        description: description ?? this.description,
        images: images ?? this.images,
      );
}
