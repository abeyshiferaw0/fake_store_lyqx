import 'package:bloc/bloc.dart';
import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/core/util/validator_util.dart';
import 'package:fake_store_lyqx/presentation/blocs/auth/auth_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginValidationCubit extends Cubit<ValidationState> {
  LoginValidationCubit() : super(ValidationState());

  void validateForm(String name, String password) {

    ValidatorUtil validatorUtil = getIt<ValidatorUtil>();

    if (!validatorUtil.validateUserName(name)) {
      emit(ValidationState(userNameInputError: "Input required"));
    } else {
      if (!validatorUtil.validatePassword(password)) {
        emit(ValidationState(
            passwordInputError: "Input must be at least 7 characters long"));
      } else {
        emit(ValidationState()); // No error



      }
    }
  }
}

class ValidationState {
  final String? userNameInputError;
  final String? passwordInputError;

  ValidationState({this.userNameInputError, this.passwordInputError});
}
