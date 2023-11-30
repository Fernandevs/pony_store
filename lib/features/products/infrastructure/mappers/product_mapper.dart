import 'package:pony_store/config/config.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';

class ProductMapper {
  static fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: double.parse(json['price'].toString()),
        category: json['category'],
        images: List<String>.from(
          json['images'].map(
            (image) => image.toString().startsWith('http')
                ? image
                : '${Environment.apiUrl}/files/product/$image',
          ),
        ),
      );
}
