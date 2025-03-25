
import 'package:fake_store_lyqx/core/api/api_service.dart';
import 'package:fake_store_lyqx/data/models/product.dart';
import 'package:injectable/injectable.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProducts();

  Future<ProductModel> fetchProduct(int id);
}

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService;

  ProductRepositoryImpl(this._apiService);

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final data = await _apiService.fetchProducts();

    final List<ProductModel> products = (data as List).map((e) {
      return ProductModel.fromJson(e);
    }).toList();

    return products;
  }

  @override
  Future<ProductModel> fetchProduct(int id) async {
    final data = await _apiService.fetchProduct(id);

    final ProductModel product = ProductModel.fromJson(data);

    return product;
  }
}
