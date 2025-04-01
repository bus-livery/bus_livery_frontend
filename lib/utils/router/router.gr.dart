// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i10;
import 'package:livery/features/auth/view/login_screen.dart' as _i4;
import 'package:livery/features/auth/view/otp_screen.dart' as _i7;
import 'package:livery/features/livery/model/livery_model/livery_model.dart'
    as _i11;
import 'package:livery/features/livery/view/livery_downloads_screen.dart'
    as _i3;
import 'package:livery/features/livery_create/view/livery_create_screen.dart'
    as _i2;
import 'package:livery/features/profile/model/profile_model.dart' as _i13;
import 'package:livery/features/profile/view/edit_profile_screen.dart' as _i1;
import 'package:livery/features/profile/view/other_profile_screen.dart' as _i6;
import 'package:livery/features/profile/view/profile_list_screen.dart' as _i8;
import 'package:livery/main_screen.dart' as _i5;

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i9.PageRouteInfo<void> {
  const EditProfileRoute({List<_i9.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i2.LiveryCreateScreen]
class LiveryCreateRoute extends _i9.PageRouteInfo<LiveryCreateRouteArgs> {
  LiveryCreateRoute({
    _i10.Key? key,
    _i11.LiveryModel? data,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         LiveryCreateRoute.name,
         args: LiveryCreateRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'LiveryCreateRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveryCreateRouteArgs>(
        orElse: () => const LiveryCreateRouteArgs(),
      );
      return _i9.WrappedRoute(
        child: _i2.LiveryCreateScreen(key: args.key, data: args.data),
      );
    },
  );
}

class LiveryCreateRouteArgs {
  const LiveryCreateRouteArgs({this.key, this.data});

  final _i10.Key? key;

  final _i11.LiveryModel? data;

  @override
  String toString() {
    return 'LiveryCreateRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i3.LiveryDownloadsScreen]
class LiveryDownloadsRoute extends _i9.PageRouteInfo<void> {
  const LiveryDownloadsRoute({List<_i9.PageRouteInfo>? children})
    : super(LiveryDownloadsRoute.name, initialChildren: children);

  static const String name = 'LiveryDownloadsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i3.LiveryDownloadsScreen());
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.OtherProfileScreen]
class OtherProfileRoute extends _i9.PageRouteInfo<OtherProfileRouteArgs> {
  OtherProfileRoute({
    _i12.Key? key,
    required _i13.ProfileModel? profileData,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         OtherProfileRoute.name,
         args: OtherProfileRouteArgs(key: key, profileData: profileData),
         initialChildren: children,
       );

  static const String name = 'OtherProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtherProfileRouteArgs>();
      return _i9.WrappedRoute(
        child: _i6.OtherProfileScreen(
          key: args.key,
          profileData: args.profileData,
        ),
      );
    },
  );
}

class OtherProfileRouteArgs {
  const OtherProfileRouteArgs({this.key, required this.profileData});

  final _i12.Key? key;

  final _i13.ProfileModel? profileData;

  @override
  String toString() {
    return 'OtherProfileRouteArgs{key: $key, profileData: $profileData}';
  }
}

/// generated route for
/// [_i7.OtpScreen]
class OtpRoute extends _i9.PageRouteInfo<void> {
  const OtpRoute({List<_i9.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.OtpScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileListScreen]
class ProfileListRoute extends _i9.PageRouteInfo<void> {
  const ProfileListRoute({List<_i9.PageRouteInfo>? children})
    : super(ProfileListRoute.name, initialChildren: children);

  static const String name = 'ProfileListRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i8.ProfileListScreen());
    },
  );
}
