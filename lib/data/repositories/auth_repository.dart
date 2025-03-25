import 'dart:convert';

import 'package:fake_store_lyqx/core/api/api_service.dart';
import 'package:fake_store_lyqx/data/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<UserModel> login(String userName, String password);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;
  final SharedPreferences _prefs;

  AuthRepositoryImpl(this._apiService, this._prefs);

  @override
  Future<UserModel> login(String userName, String password) async {
    final data = await _apiService.loginUser(userName, password);

    final user = UserModel.fromJson(
      {
        'user_name': userName,
        'token': data['token'],
      },
    );

    // Save user data to SharedPreferences
    await _prefs.setString('user', jsonEncode(user.toJson()));

    return user;
  }
}
