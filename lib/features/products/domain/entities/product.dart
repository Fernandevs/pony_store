import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String description,
    required double price,
    required String category,
    @Default([]) List<String> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

/* class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String>? images;
  final User? user;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
    this.user,
  });

  @override
  String toString() => 'Product{\n'
      'id: $id,\n'
      'price: $price,\n'
      'description: $description,\n'
      'user: $user,\n'
      'images: $images\n'
  '}';
} */
