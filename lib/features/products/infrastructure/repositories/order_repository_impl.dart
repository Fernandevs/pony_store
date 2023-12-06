import 'package:pony_store/features/products/domain/datasources/order_datasource.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';
import 'package:pony_store/features/products/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderDatasource datasource;

  OrderRepositoryImpl(this.datasource);

  @override
  Future<String> order({
    required double amount,
    required List<Product> items,
  }) => datasource.order(amount: amount, items: items);
}
