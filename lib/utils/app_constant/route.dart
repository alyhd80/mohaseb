

import 'package:flutter/cupertino.dart';
import 'package:mohaseb/screen/login/login_page.dart';
import 'package:mohaseb/screen/splash/splash_page.dart';
import 'package:mohaseb/screen/verify/verify_page.dart';

class AppRout {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String verify = '/verify';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    verify: (context) => const VerifyPage(),

  };

}