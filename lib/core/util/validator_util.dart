import 'package:injectable/injectable.dart';

@injectable
class ValidatorUtil {
  bool validateUserName(String s) {
    if (s.isNotEmpty) {
      return true;
    }
    return false;
  }

  validatePassword(String s) {
    if (s.length >= 7) {
      return true;
    }
    return false;
  }

  validateLoginForm(String u,String p) {
    if (u.isNotEmpty&& p.length>=7) {
      return true;
    }
    return false;
  }


}
