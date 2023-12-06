import 'package:pony_store/features/orders/domain/entities/order.dart';

abstract class OrdersRepository {
  Future<List<Order>> findAll({int limit = 10, int offset = 0});

  Future<Order> findOne({required String id});
}
