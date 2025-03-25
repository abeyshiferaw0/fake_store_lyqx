import 'dart:convert';

import 'package:fake_store_lyqx/core/api/api_service.dart';
import 'package:fake_store_lyqx/data/models/product.dart';
import 'package:fake_store_lyqx/data/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProducts();
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
}
