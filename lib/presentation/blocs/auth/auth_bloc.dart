import 'package:fake_store_lyqx/data/models/user.dart';
import 'package:fake_store_lyqx/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user =
            await _authRepository.login(event.userName, event.password);
        emit(AuthSuccess(user));
      } catch (e, s) {
        emit(AuthFailure(s.toString()));
      }
    });
  }
}
