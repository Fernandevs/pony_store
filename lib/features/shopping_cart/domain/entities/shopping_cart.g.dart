// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingCartImpl _$$ShoppingCartImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingCartImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$ShoppingCartImplToJson(_$ShoppingCartImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
