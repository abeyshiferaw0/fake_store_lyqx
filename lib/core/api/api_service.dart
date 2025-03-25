import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> loginUser(String userName, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'username': userName,
      'password': password,
    });
    return response.data;
  }

  Future fetchProducts() async {
    final response = await _dio.get('/products');
    return response.data;
  }
  Future fetchProduct(int id) async {
    final response = await _dio.get('/products/$id');
    return response.data;
  }
}
