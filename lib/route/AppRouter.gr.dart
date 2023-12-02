// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:mohaseb/screen/login/login_page.dart' as _i1;
import 'package:mohaseb/screen/login_with_password/login_with_password_page.dart'
    as _i2;
import 'package:mohaseb/screen/main/main_page.dart' as _i3;
import 'package:mohaseb/screen/splash/splash_page.dart' as _i4;
import 'package:mohaseb/screen/verify/verify_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    Login_with_password.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginWithPasswordPage(),
      );
    },
    Main.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    Splash.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    Verify.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<VerifyArgs>(
          orElse: () => VerifyArgs(
                phoneNumber: pathParams.getString('phoneNumber'),
                token: pathParams.getString('token'),
              ));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.VerifyPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
          token: args.token,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class Login extends _i6.PageRouteInfo<void> {
  const Login({List<_i6.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginWithPasswordPage]
class Login_with_password extends _i6.PageRouteInfo<void> {
  const Login_with_password({List<_i6.PageRouteInfo>? children})
      : super(
          Login_with_password.name,
          initialChildren: children,
        );

  static const String name = 'Login_with_password';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainPage]
class Main extends _i6.PageRouteInfo<void> {
  const Main({List<_i6.PageRouteInfo>? children})
      : super(
          Main.name,
          initialChildren: children,
        );

  static const String name = 'Main';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class Splash extends _i6.PageRouteInfo<void> {
  const Splash({List<_i6.PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.VerifyPage]
class Verify extends _i6.PageRouteInfo<VerifyArgs> {
  Verify({
    _i7.Key? key,
    required String phoneNumber,
    required String token,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<VerifyArgs> page = _i6.PageInfo<VerifyArgs>(name);
}

class VerifyArgs {
  const VerifyArgs({
    this.key,
    required this.phoneNumber,
    required this.token,
  });

  final _i7.Key? key;

  final String phoneNumber;

  final String token;

  @override
  String toString() {
    return 'VerifyArgs{key: $key, phoneNumber: $phoneNumber, token: $token}';
  }
}
