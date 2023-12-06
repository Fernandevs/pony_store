import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:pony_store/config/constants/environment.dart';
import 'package:pony_store/features/products/domain/datasources/order_datasource.dart';
import 'package:pony_store/features/products/domain/entities/product.dart';

class OrderDatasourceImpl extends OrderDatasource {
  late final Dio dio;
  final String token;

  OrderDatasourceImpl({
    required this.token,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $token'},
          ),
        );

  @override
  Future<String> order({
    required double amount,
    required List<Product> items,
  }) async {
    final Map<String, dynamic> data = {"total": amount, "items": items};

    final createOrderDto = json.encode(data);
    final response = await dio.post('/order', data: createOrderDto);
    final dataResponse = response.data.toString().split(',');

    return dataResponse[dataResponse.length - 2].toString();
  }
}
