import 'package:pony_store/features/products/domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<Product> createOrUpdateProduct(Map<String, dynamic> productLike) =>
      datasource.createOrUpdateProduct(productLike);

  @override
  Future<Product> getProductById(String id) => datasource.getProductById(id);

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) =>
      datasource.getProductsByPage(limit: limit, offset: offset);

  @override
  Future<List<Product>> searchProductByTerm(String term) =>
      datasource.searchProductByTerm(term);
}
