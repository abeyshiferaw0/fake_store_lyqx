import 'package:fake_store_lyqx/core/di/injector.dart';
import 'package:fake_store_lyqx/presentation/blocs/auth/auth_bloc.dart';
import 'package:fake_store_lyqx/presentation/blocs/auth/login_validation_cubit.dart';
import 'package:fake_store_lyqx/presentation/blocs/products/products_bloc.dart';
import 'package:fake_store_lyqx/presentation/screens/cart_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/fav_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/home_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/login_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/main_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/product_detail_screen.dart';
import 'package:fake_store_lyqx/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

//
final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  // routes constants defined
  static const String initial = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String fav = '/fav';
  static const String cart = '/cart';
  static const String details = '/details';
}

// Define the GoRouter instance
final GoRouter goRouter = GoRouter(
  initialLocation: AppRoutes.initial,
  navigatorKey: _routerKey,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<LoginValidationCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<AuthBloc>(),
            ),
          ],
          child: LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.details,
      builder: (BuildContext context, GoRouterState state) {
        return ProductDetailScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<ProductsBloc>(),
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.fav,
              builder: (context, state) => FavScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.cart,
              builder: (context, state) => CartScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
