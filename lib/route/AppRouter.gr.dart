// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:mohaseb/screen/chnage_password/change_password_page.dart'
    as _i1;
import 'package:mohaseb/screen/login/login_page.dart' as _i2;
import 'package:mohaseb/screen/login_with_password/login_with_password_page.dart'
    as _i3;
import 'package:mohaseb/screen/main/main_page.dart' as _i4;
import 'package:mohaseb/screen/setting/setting_page.dart' as _i5;
import 'package:mohaseb/screen/splash/splash_page.dart' as _i6;
import 'package:mohaseb/screen/verify/verify_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    Change_password.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChangePassword(),
      );
    },
    Login.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    Login_with_password.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Login_with_passwordArgs>(
          orElse: () => Login_with_passwordArgs(
              phoneNumber: pathParams.getString('phoneNumber')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginWithPasswordPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    Main.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    Setting.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingPage(),
      );
    },
    Splash.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
    Verify.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VerifyArgs>(
          orElse: () => VerifyArgs(
                phoneNumber: pathParams.getString('phoneNumber'),
                token: pathParams.getString('token'),
              ));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.VerifyPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          token: args.token,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChangePassword]
class Change_password extends _i8.PageRouteInfo<void> {
  const Change_password({List<_i8.PageRouteInfo>? children})
      : super(
          Change_password.name,
          initialChildren: children,
        );

  static const String name = 'Change_password';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class Login extends _i8.PageRouteInfo<void> {
  const Login({List<_i8.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginWithPasswordPage]
class Login_with_password extends _i8.PageRouteInfo<Login_with_passwordArgs> {
  Login_with_password({
    _i9.Key? key,
    required String phoneNumber,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          Login_with_password.name,
          args: Login_with_passwordArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          rawPathParams: {'phoneNumber': phoneNumber},
          initialChildren: children,
        );

  static const String name = 'Login_with_password';

  static const _i8.PageInfo<Login_with_passwordArgs> page =
      _i8.PageInfo<Login_with_passwordArgs>(name);
}

class Login_with_passwordArgs {
  const Login_with_passwordArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i9.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'Login_with_passwordArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i4.MainPage]
class Main extends _i8.PageRouteInfo<void> {
  const Main({List<_i8.PageRouteInfo>? children})
      : super(
          Main.name,
          initialChildren: children,
        );

  static const String name = 'Main';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingPage]
class Setting extends _i8.PageRouteInfo<void> {
  const Setting({List<_i8.PageRouteInfo>? children})
      : super(
          Setting.name,
          initialChildren: children,
        );

  static const String name = 'Setting';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class Splash extends _i8.PageRouteInfo<void> {
  const Splash({List<_i8.PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.VerifyPage]
class Verify extends _i8.PageRouteInfo<VerifyArgs> {
  Verify({
    _i10.Key? key,
    required String phoneNumber,
    required String token,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          Verify.name,
          args: VerifyArgs(
            key: key,
            phoneNumber: phoneNumber,
            token: token,
          ),
          rawPathParams: {
            'phoneNumber': phoneNumber,
            'token': token,
          },
          initialChildren: children,
        );

  static const String name = 'Verify';

  static const _i8.PageInfo<VerifyArgs> page = _i8.PageInfo<VerifyArgs>(name);
}

class VerifyArgs {
  const VerifyArgs({
    this.key,
    required this.phoneNumber,
    required this.token,
  });

  final _i10.Key? key;

  final String phoneNumber;

  final String token;

  @override
  String toString() {
    return 'VerifyArgs{key: $key, phoneNumber: $phoneNumber, token: $token}';
  }
}
