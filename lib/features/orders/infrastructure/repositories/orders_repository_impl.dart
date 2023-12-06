import 'package:pony_store/features/orders/domain/datasources/orders_datasource.dart';
import 'package:pony_store/features/orders/domain/entities/order.dart';
import 'package:pony_store/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersDatasource _datasource;

  OrdersRepositoryImpl(this._datasource);

  @override
  Future<List<Order>> findAll({int limit = 10, int offset = 0}) =>
      _datasource.findAll(limit: limit, offset: offset);

  @override
  Future<Order> findOne({required String id}) => _datasource.findOne(id: id);
}
