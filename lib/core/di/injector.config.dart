// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:fake_store_lyqx/core/api/api_service.dart' as _i112;
import 'package:fake_store_lyqx/core/di/modules.dart' as _i584;
import 'package:fake_store_lyqx/core/util/auth_util.dart' as _i698;
import 'package:fake_store_lyqx/core/util/validator_util.dart' as _i892;
import 'package:fake_store_lyqx/data/repositories/auth_repository.dart'
    as _i1053;
import 'package:fake_store_lyqx/data/repositories/product_repository.dart'
    as _i914;
import 'package:fake_store_lyqx/presentation/blocs/auth/auth_bloc.dart'
    as _i697;
import 'package:fake_store_lyqx/presentation/blocs/auth/login_validation_cubit.dart'
    as _i296;
import 'package:fake_store_lyqx/presentation/blocs/products/products_bloc.dart'
    as _i366;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i296.LoginValidationCubit>(() => _i296.LoginValidationCubit());
    gh.factory<_i892.ValidatorUtil>(() => _i892.ValidatorUtil());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.factory<_i698.AuthUtil>(
        () => _i698.AuthUtil(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i112.ApiService>(() => _i112.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i914.ProductRepository>(
        () => _i914.ProductRepositoryImpl(gh<_i112.ApiService>()));
    gh.lazySingleton<_i1053.AuthRepository>(() => _i1053.AuthRepositoryImpl(
          gh<_i112.ApiService>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i366.ProductsBloc>(
        () => _i366.ProductsBloc(gh<_i914.ProductRepository>()));
    gh.factory<_i697.AuthBloc>(
        () => _i697.AuthBloc(gh<_i1053.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i584.RegisterModule {}
