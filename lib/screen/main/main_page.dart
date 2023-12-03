import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/screen/main/component/bottom_sheet.dart';

@RoutePage(name: "main")
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(alignment: Alignment.bottomCenter,child: BottomSheetWidget(),)
        ],
      ),
    );
  }
}
