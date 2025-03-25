import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event, Bloc: ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $transition, Bloc: ${bloc.runtimeType}');
  }

  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   super.onError(bloc, error, stackTrace);
  //   print('Error: $error, Bloc: ${bloc.runtimeType}');
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace); // Call super to keep the default behavior
    print('Error: $error, Bloc: ${bloc.runtimeType}');
  }
}
