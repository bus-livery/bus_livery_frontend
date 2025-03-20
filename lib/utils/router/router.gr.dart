// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:livery/features/auth/view/login_screen.dart' as _i3;
import 'package:livery/features/auth/view/otp_screen.dart' as _i5;
import 'package:livery/features/livery/model/livery_model/livery_model.dart'
    as _i8;
import 'package:livery/features/livery_create/view/livery_create_screen.dart'
    as _i2;
import 'package:livery/features/profile/view/edit_profile_screen.dart' as _i1;
import 'package:livery/main_screen.dart' as _i4;

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i6.PageRouteInfo<void> {
  const EditProfileRoute({List<_i6.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i2.LiveryCreateScreen]
class LiveryCreateRoute extends _i6.PageRouteInfo<LiveryCreateRouteArgs> {
  LiveryCreateRoute({
    _i7.Key? key,
    _i8.LiveryModel? data,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         LiveryCreateRoute.name,
         args: LiveryCreateRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'LiveryCreateRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveryCreateRouteArgs>(
        orElse: () => const LiveryCreateRouteArgs(),
      );
      return _i6.WrappedRoute(
        child: _i2.LiveryCreateScreen(key: args.key, data: args.data),
      );
    },
  );
}

class LiveryCreateRouteArgs {
  const LiveryCreateRouteArgs({this.key, this.data});

  final _i7.Key? key;

  final _i8.LiveryModel? data;

  @override
  String toString() {
    return 'LiveryCreateRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainScreen();
    },
  );
}

/// generated route for
/// [_i5.OtpScreen]
class OtpRoute extends _i6.PageRouteInfo<void> {
  const OtpRoute({List<_i6.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.OtpScreen();
    },
  );
}
