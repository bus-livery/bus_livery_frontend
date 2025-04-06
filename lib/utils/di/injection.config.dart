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
import 'package:livery/Cfeature/report/application/report_bloc.dart' as _i473;
import 'package:livery/Cfeature/report/service/report_service.dart' as _i67;
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
import 'package:livery/features/top_users/application/top_users_bloc.dart'
    as _i721;
import 'package:livery/features/top_users/service/top_users_service.dart'
    as _i638;
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
    gh.factory<_i638.TopUsersService>(
      () => _i638.TopUsersService(gh<_i833.DioService>()),
    );
    gh.lazySingleton<_i67.IReportService>(
      () => _i67.ReportService(gh<_i833.DioService>()),
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
    gh.factory<_i469.ProfileBloc>(
      () => _i469.ProfileBloc(gh<_i923.IProfileService>()),
    );
    gh.factory<_i366.LiveryBloc>(
      () => _i366.LiveryBloc(gh<_i1027.ILiveryService>(), gh<_i14.AppRouter>()),
    );
    gh.factory<_i473.ReportBloc>(
      () => _i473.ReportBloc(gh<_i67.IReportService>()),
    );
    gh.factory<_i721.TopUsersBloc>(
      () => _i721.TopUsersBloc(gh<_i638.TopUsersService>()),
    );
    return this;
  }
}
