import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pony_store/features/auth/presentation/providers/auth_provider.dart';
import 'package:pony_store/features/products/domain/repositories/products_repository.dart';
import 'package:pony_store/features/products/infrastructure/infrastructure.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final token = ref.watch(authProvider).user?.token ?? '';

  final productsRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl(token: token),
  );

  return productsRepository;
});
