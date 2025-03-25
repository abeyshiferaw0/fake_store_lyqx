import 'dart:convert';
import 'package:fake_store_lyqx/data/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthUtil {
  final SharedPreferences _prefs;

  AuthUtil(this._prefs);

  UserModel getUser() {
    String s = _prefs.getString('user')!;
    return UserModel.fromJson(jsonDecode(s));
  }

   logout() {
    _prefs.clear();
  }
}
