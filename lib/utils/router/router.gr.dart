// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i12;
import 'package:livery/features/auth/view/gmail_with_otp_screen.dart' as _i2;
import 'package:livery/features/auth/view/otp_screen.dart' as _i8;
import 'package:livery/features/horn/view/horn_create_screen.dart' as _i3;
import 'package:livery/features/livery/model/livery_model/livery_model.dart'
    as _i13;
import 'package:livery/features/livery/view/livery_downloads_screen.dart'
    as _i5;
import 'package:livery/features/livery_create/view/livery_create_screen.dart'
    as _i4;
import 'package:livery/features/profile/model/profile_model.dart' as _i15;
import 'package:livery/features/profile/view/edit_profile_screen.dart' as _i1;
import 'package:livery/features/profile/view/other_profile_screen.dart' as _i7;
import 'package:livery/features/profile/view/profile_list_screen.dart' as _i9;
import 'package:livery/features/profile/view/web_content_screen.dart' as _i10;
import 'package:livery/main_screen.dart' as _i6;

/// generated route for
/// [_i1.EditProfileScreen]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i2.GmailWithOtpScreen]
class GmailWithOtpRoute extends _i11.PageRouteInfo<void> {
  const GmailWithOtpRoute({List<_i11.PageRouteInfo>? children})
    : super(GmailWithOtpRoute.name, initialChildren: children);

  static const String name = 'GmailWithOtpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.GmailWithOtpScreen();
    },
  );
}

/// generated route for
/// [_i3.HornCreateScreen]
class HornCreateRoute extends _i11.PageRouteInfo<void> {
  const HornCreateRoute({List<_i11.PageRouteInfo>? children})
    : super(HornCreateRoute.name, initialChildren: children);

  static const String name = 'HornCreateRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HornCreateScreen();
    },
  );
}

/// generated route for
/// [_i4.LiveryCreateScreen]
class LiveryCreateRoute extends _i11.PageRouteInfo<LiveryCreateRouteArgs> {
  LiveryCreateRoute({
    _i12.Key? key,
    _i13.LiveryModel? data,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         LiveryCreateRoute.name,
         args: LiveryCreateRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'LiveryCreateRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveryCreateRouteArgs>(
        orElse: () => const LiveryCreateRouteArgs(),
      );
      return _i11.WrappedRoute(
        child: _i4.LiveryCreateScreen(key: args.key, data: args.data),
      );
    },
  );
}

class LiveryCreateRouteArgs {
  const LiveryCreateRouteArgs({this.key, this.data});

  final _i12.Key? key;

  final _i13.LiveryModel? data;

  @override
  String toString() {
    return 'LiveryCreateRouteArgs{key: $key, data: $data}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LiveryCreateRouteArgs) return false;
    return key == other.key && data == other.data;
  }

  @override
  int get hashCode => key.hashCode ^ data.hashCode;
}

/// generated route for
/// [_i5.LiveryDownloadsScreen]
class LiveryDownloadsRoute extends _i11.PageRouteInfo<void> {
  const LiveryDownloadsRoute({List<_i11.PageRouteInfo>? children})
    : super(LiveryDownloadsRoute.name, initialChildren: children);

  static const String name = 'LiveryDownloadsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return _i11.WrappedRoute(child: const _i5.LiveryDownloadsScreen());
    },
  );
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainScreen();
    },
  );
}

/// generated route for
/// [_i7.OtherProfileScreen]
class OtherProfileRoute extends _i11.PageRouteInfo<OtherProfileRouteArgs> {
  OtherProfileRoute({
    _i14.Key? key,
    required _i15.ProfileModel? profileData,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         OtherProfileRoute.name,
         args: OtherProfileRouteArgs(key: key, profileData: profileData),
         initialChildren: children,
       );

  static const String name = 'OtherProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtherProfileRouteArgs>();
      return _i11.WrappedRoute(
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

  final _i14.Key? key;

  final _i15.ProfileModel? profileData;

  @override
  String toString() {
    return 'OtherProfileRouteArgs{key: $key, profileData: $profileData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtherProfileRouteArgs) return false;
    return key == other.key && profileData == other.profileData;
  }

  @override
  int get hashCode => key.hashCode ^ profileData.hashCode;
}

/// generated route for
/// [_i8.OtpScreen]
class OtpRoute extends _i11.PageRouteInfo<void> {
  const OtpRoute({List<_i11.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.OtpScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileListScreen]
class ProfileListRoute extends _i11.PageRouteInfo<void> {
  const ProfileListRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileListRoute.name, initialChildren: children);

  static const String name = 'ProfileListRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return _i11.WrappedRoute(child: const _i9.ProfileListScreen());
    },
  );
}

/// generated route for
/// [_i10.WebContentScreen]
class WebContentRoute extends _i11.PageRouteInfo<WebContentRouteArgs> {
  WebContentRoute({
    _i12.Key? key,
    required _i10.WebContentType contentType,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         WebContentRoute.name,
         args: WebContentRouteArgs(key: key, contentType: contentType),
         initialChildren: children,
       );

  static const String name = 'WebContentRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebContentRouteArgs>();
      return _i10.WebContentScreen(
        key: args.key,
        contentType: args.contentType,
      );
    },
  );
}

class WebContentRouteArgs {
  const WebContentRouteArgs({this.key, required this.contentType});

  final _i12.Key? key;

  final _i10.WebContentType contentType;

  @override
  String toString() {
    return 'WebContentRouteArgs{key: $key, contentType: $contentType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebContentRouteArgs) return false;
    return key == other.key && contentType == other.contentType;
  }

  @override
  int get hashCode => key.hashCode ^ contentType.hashCode;
}
