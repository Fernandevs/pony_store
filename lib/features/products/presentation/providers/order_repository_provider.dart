import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pony_store/features/auth/presentation/providers/auth_provider.dart';
import 'package:pony_store/features/products/domain/repositories/order_repository.dart';
import 'package:pony_store/features/products/infrastructure/datasources/order_datasource_impl.dart';
import 'package:pony_store/features/products/infrastructure/repositories/order_repository_impl.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final token = ref.watch(authProvider).user?.token ?? '';

  final orderRepository = OrderRepositoryImpl(
    OrderDatasourceImpl(token: token),
  );

  return orderRepository;
});
