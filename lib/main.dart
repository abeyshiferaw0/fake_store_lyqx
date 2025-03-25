import 'dart:async' as BlocOverrides;

import 'package:fake_store_lyqx/config/theme.dart';
import 'package:fake_store_lyqx/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'config/router.dart';
import 'core/di/injector.dart';
import 'presentation/blocs/app_bloc_observer.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Set up injectable and get_it
  configureDependencies();
  //Log bloc activity
  Bloc.observer = AppBlocObserver();
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SIZER USED FOR RESPONSIVE UI
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Fake Store Demo',
          theme: AppTheme.lightTheme(),
          routerConfig: goRouter,
        );
      },
    );
  }
}
