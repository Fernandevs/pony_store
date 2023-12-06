import 'package:pony_store/features/products/domain/entities/product.dart';

abstract class OrderRepository {
  Future<String> order({required double amount, required List<Product> items});
}
