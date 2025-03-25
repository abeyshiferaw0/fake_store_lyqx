import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://fakestoreapi.com';
    dio.options.headers['Content-Type'] = 'application/json';
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
}
