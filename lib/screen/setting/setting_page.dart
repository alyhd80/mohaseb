import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/screen/setting/component/setting_body.dart';

@RoutePage(name: "setting")
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SafeArea(child: Container()),
          SettingBody(size: size)
        ],),
      ),
    );
  }
}
