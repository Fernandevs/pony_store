import 'package:dio/dio.dart';

import 'package:pony_store/config/constants/environment.dart';
import 'package:pony_store/features/orders/domain/datasources/orders_datasource.dart';
import 'package:pony_store/features/orders/domain/entities/order.dart';

class OrdersDatasourceImpl extends OrdersDatasource {
  late final Dio dio;
  final String token;

  OrdersDatasourceImpl({
    required this.token,
  }) : dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {'Authorization': 'Bearer $token'},
    ),
  );

  @override
  Future<List<Order>> findAll({int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>('/order?limit=$limit&offset=$offset');
    final List<Order> orders = [];

    for (final order in response.data ?? []) {
      orders.add(Order.fromJson(order));
    }

    return orders;
  }

  @override
  Future<Order> findOne({required String id}) async {
    try {
      final response = await dio.get('/order/$id');
      final Order order = Order.fromJson(response.data);
      return order;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) throw Exception();
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
