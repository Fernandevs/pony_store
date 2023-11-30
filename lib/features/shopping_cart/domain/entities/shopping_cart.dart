import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pony_store/features/products/domain/domain.dart';

part 'shopping_cart.freezed.dart';

part 'shopping_cart.g.dart';

@freezed
class ShoppingCart with _$ShoppingCart {
  const factory ShoppingCart({
    required Product product,
    required int quantity,
  }) = _ShoppingCart;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);
}
