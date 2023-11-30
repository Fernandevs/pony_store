// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) {
  return _ShoppingCart.fromJson(json);
}

/// @nodoc
mixin _$ShoppingCart {
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingCartCopyWith<ShoppingCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartCopyWith<$Res> {
  factory $ShoppingCartCopyWith(
          ShoppingCart value, $Res Function(ShoppingCart) then) =
      _$ShoppingCartCopyWithImpl<$Res, ShoppingCart>;
  @useResult
  $Res call({Product product, int quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ShoppingCartCopyWithImpl<$Res, $Val extends ShoppingCart>
    implements $ShoppingCartCopyWith<$Res> {
  _$ShoppingCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingCartImplCopyWith<$Res>
    implements $ShoppingCartCopyWith<$Res> {
  factory _$$ShoppingCartImplCopyWith(
          _$ShoppingCartImpl value, $Res Function(_$ShoppingCartImpl) then) =
      __$$ShoppingCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, int quantity});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ShoppingCartImplCopyWithImpl<$Res>
    extends _$ShoppingCartCopyWithImpl<$Res, _$ShoppingCartImpl>
    implements _$$ShoppingCartImplCopyWith<$Res> {
  __$$ShoppingCartImplCopyWithImpl(
      _$ShoppingCartImpl _value, $Res Function(_$ShoppingCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$ShoppingCartImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingCartImpl implements _ShoppingCart {
  const _$ShoppingCartImpl({required this.product, required this.quantity});

  factory _$ShoppingCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingCartImplFromJson(json);

  @override
  final Product product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ShoppingCart(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCartImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCartImplCopyWith<_$ShoppingCartImpl> get copyWith =>
      __$$ShoppingCartImplCopyWithImpl<_$ShoppingCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingCartImplToJson(
      this,
    );
  }
}

abstract class _ShoppingCart implements ShoppingCart {
  const factory _ShoppingCart(
      {required final Product product,
      required final int quantity}) = _$ShoppingCartImpl;

  factory _ShoppingCart.fromJson(Map<String, dynamic> json) =
      _$ShoppingCartImpl.fromJson;

  @override
  Product get product;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingCartImplCopyWith<_$ShoppingCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
