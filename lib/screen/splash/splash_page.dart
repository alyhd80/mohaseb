import 'package:flutter/material.dart';
import 'package:mohaseb/screen/splash/component/splash_body.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: "splash")
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(),
    );
  }
}
