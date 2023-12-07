import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/main/component/bottom_sheet.dart';
import 'package:mohaseb/screen/main/view_model/main_view_model.dart';
import 'package:mohaseb/screen/profile/profile_page.dart';

@RoutePage(name: "main")
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
        Consumer(builder: (context,ref,widget){
          MainViewModel viewModel=ref.watch(mainViewModelProvider);
          return PageView(
            reverse: true,
            controller: viewModel.pageController,
            children: [
              Container(color: Colors.red,),
              Container(color: Colors.blue,),
              Container(color: Colors.black,),
          ProfilePage()

            ],
          );
        }),

          Align(alignment: Alignment.bottomCenter,child: BottomSheetWidget(),)
        ],
      ),
    );
  }
}
