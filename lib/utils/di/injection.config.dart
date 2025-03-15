// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:livery/features/auth/application/auth_bloc.dart' as _i632;
import 'package:livery/features/auth/service/auth_service.dart' as _i148;
import 'package:livery/features/livery/application/livery_bloc.dart' as _i366;
import 'package:livery/features/livery/service/livery_service.dart' as _i1027;
import 'package:livery/features/livery_create/application/livery_create_bloc.dart'
    as _i117;
import 'package:livery/features/livery_create/service/livery_create_service.dart'
    as _i154;
import 'package:livery/features/profile/application/profile_bloc.dart' as _i469;
import 'package:livery/features/profile/service/profile_service.dart' as _i923;
import 'package:livery/service/dio_service.dart' as _i833;
import 'package:livery/service/shared_pref_service.dart' as _i552;
import 'package:livery/utils/router/router.dart' as _i14;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i14.AppRouter>(() => _i14.AppRouter());
    gh.lazySingleton<_i833.DioService>(() => _i833.DioService());
    gh.lazySingleton<_i552.SharedPrefService>(() => _i552.SharedPrefService());
    gh.lazySingleton<_i148.IAuthService>(
      () => _i148.AuthService(
        gh<_i833.DioService>(),
        gh<_i552.SharedPrefService>(),
      ),
    );
    gh.lazySingleton<_i1027.ILiveryService>(
      () => _i1027.LiveryService(gh<_i833.DioService>()),
    );
    gh.lazySingleton<_i154.ILiveryCreateService>(
      () => _i154.LiveryCreateService(gh<_i833.DioService>()),
    );
    gh.factory<_i117.LiveryCreateBloc>(
      () => _i117.LiveryCreateBloc(gh<_i154.ILiveryCreateService>()),
    );
    gh.lazySingleton<_i923.IProfileService>(
      () => _i923.ProfileService(gh<_i833.DioService>()),
    );
    gh.factory<_i632.AuthBloc>(() => _i632.AuthBloc(gh<_i148.IAuthService>()));
    gh.factory<_i366.LiveryBloc>(
      () => _i366.LiveryBloc(gh<_i1027.ILiveryService>()),
    );
    gh.factory<_i469.ProfileBloc>(
      () => _i469.ProfileBloc(gh<_i923.IProfileService>()),
    );
    return this;
  }
}
