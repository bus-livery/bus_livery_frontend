// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i13;
import 'package:livery/features/auth/view/login_screen.dart' as _i4;
import 'package:livery/features/auth/view/login_with_otp_screen.dart' as _i5;
import 'package:livery/features/auth/view/otp_screen.dart' as _i8;
import 'package:livery/features/auth/view/signup_screen.dart' as _i10;
import 'package:livery/features/livery/model/livery_model/livery_model.dart'
    as _i14;
import 'package:livery/features/livery/view/livery_downloads_screen.dart'
    as _i3;
import 'package:livery/features/livery_create/view/livery_create_screen.dart'
    as _i2;
import 'package:livery/features/profile/model/profile_model.dart' as _i16;
import 'package:livery/features/profile/view/edit_profile_screen.dart' as _i1;
import 'package:livery/features/profile/view/other_profile_screen.dart' as _i7;
import 'package:livery/features/profile/view/profile_list_screen.dart' as _i9;
import 'package:livery/features/profile/view/web_content_screen.dart' as _i11;
import 'package:livery/main_screen.dart' as _i6;

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i12.PageRouteInfo<void> {
  const EditProfileRoute({List<_i12.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i2.LiveryCreateScreen]
class LiveryCreateRoute extends _i12.PageRouteInfo<LiveryCreateRouteArgs> {
  LiveryCreateRoute({
    _i13.Key? key,
    _i14.LiveryModel? data,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         LiveryCreateRoute.name,
         args: LiveryCreateRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'LiveryCreateRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveryCreateRouteArgs>(
        orElse: () => const LiveryCreateRouteArgs(),
      );
      return _i12.WrappedRoute(
        child: _i2.LiveryCreateScreen(key: args.key, data: args.data),
      );
    },
  );
}

class LiveryCreateRouteArgs {
  const LiveryCreateRouteArgs({this.key, this.data});

  final _i13.Key? key;

  final _i14.LiveryModel? data;

  @override
  String toString() {
    return 'LiveryCreateRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i3.LiveryDownloadsScreen]
class LiveryDownloadsRoute extends _i12.PageRouteInfo<void> {
  const LiveryDownloadsRoute({List<_i12.PageRouteInfo>? children})
    : super(LiveryDownloadsRoute.name, initialChildren: children);

  static const String name = 'LiveryDownloadsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i3.LiveryDownloadsScreen());
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginWithOtpScreen]
class LoginWithOtpRoute extends _i12.PageRouteInfo<void> {
  const LoginWithOtpRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginWithOtpRoute.name, initialChildren: children);

  static const String name = 'LoginWithOtpRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginWithOtpScreen();
    },
  );
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainScreen();
    },
  );
}

/// generated route for
/// [_i7.OtherProfileScreen]
class OtherProfileRoute extends _i12.PageRouteInfo<OtherProfileRouteArgs> {
  OtherProfileRoute({
    _i15.Key? key,
    required _i16.ProfileModel? profileData,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         OtherProfileRoute.name,
         args: OtherProfileRouteArgs(key: key, profileData: profileData),
         initialChildren: children,
       );

  static const String name = 'OtherProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtherProfileRouteArgs>();
      return _i12.WrappedRoute(
        child: _i7.OtherProfileScreen(
          key: args.key,
          profileData: args.profileData,
        ),
      );
    },
  );
}

class OtherProfileRouteArgs {
  const OtherProfileRouteArgs({this.key, required this.profileData});

  final _i15.Key? key;

  final _i16.ProfileModel? profileData;

  @override
  String toString() {
    return 'OtherProfileRouteArgs{key: $key, profileData: $profileData}';
  }
}

/// generated route for
/// [_i8.OtpScreen]
class OtpRoute extends _i12.PageRouteInfo<void> {
  const OtpRoute({List<_i12.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.OtpScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileListScreen]
class ProfileListRoute extends _i12.PageRouteInfo<void> {
  const ProfileListRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileListRoute.name, initialChildren: children);

  static const String name = 'ProfileListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i9.ProfileListScreen());
    },
  );
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute({List<_i12.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i11.WebContentScreen]
class WebContentRoute extends _i12.PageRouteInfo<WebContentRouteArgs> {
  WebContentRoute({
    _i13.Key? key,
    required _i11.WebContentType contentType,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         WebContentRoute.name,
         args: WebContentRouteArgs(key: key, contentType: contentType),
         initialChildren: children,
       );

  static const String name = 'WebContentRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebContentRouteArgs>();
      return _i11.WebContentScreen(
        key: args.key,
        contentType: args.contentType,
      );
    },
  );
}

class WebContentRouteArgs {
  const WebContentRouteArgs({this.key, required this.contentType});

  final _i13.Key? key;

  final _i11.WebContentType contentType;

  @override
  String toString() {
    return 'WebContentRouteArgs{key: $key, contentType: $contentType}';
  }
}
