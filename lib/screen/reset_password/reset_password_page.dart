import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/screen/reset_password/component/reset_password_body.dart';



@RoutePage(name: "reset_password")
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05>15?15:size.width*0.05),        child: Column(children: [
          SafeArea(child: Container()),
          Expanded(child: ResetPasswordBody(size: size,))
        ],),
      ),
    );
  }
}
