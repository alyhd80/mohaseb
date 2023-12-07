import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/main/component/bottom_nav_tab_widget.dart';
import 'package:mohaseb/screen/main/view_model/main_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class BottomSheetWidget extends ConsumerWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainViewModel viewModel = ref.watch(mainViewModelProvider);
    Size size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.07 > 65 ? 65 : size.height * 0.07<45?45:size.height * 0.07,
            width: size.width,
            margin: EdgeInsets.only(
                right: size.width * 0.5 > 15 ? 15 : size.width * 0.5,
                left: size.width * 0.5 > 15 ? 15 : size.width * 0.5,
                bottom: size.height * 0.01 > 10 ? 10 : size.height * 0.01),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: BottomNavTabWidget(
                  iconData:viewModel.pageSelected == 3? Boxicons.bxs_user_circle:Boxicons.bx_user_circle,
                  isSelectedPage: viewModel.pageSelected == 3,
                  onTap: () {
                    viewModel.pageSelected = 3;
                  },
                )),
                Expanded(
                    child: BottomNavTabWidget(
                  iconData: Icons.add_box,
                  isSelectedPage: viewModel.pageSelected == 2,
                  onTap: () {
                    viewModel.pageSelected = 2;
                  },
                )),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                    child: BottomNavTabWidget(
                  iconData: Icons.add_box,
                  isSelectedPage: viewModel.pageSelected == 1,
                  onTap: () {
                    viewModel.pageSelected = 1;
                  },
                )),
                Expanded(
                    child: BottomNavTabWidget(
                  iconData: Icons.add_box,
                  isSelectedPage: viewModel.pageSelected == 0,
                  onTap: () {
                    viewModel.pageSelected = 0;
                  },
                )),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
                bottom:
                    (size.height * 0.07 > 65 ? 65 : size.height * 0.07<45?45:size.height * 0.07) / 2.5),
            child: Container(
              height: (size.height * 0.07 > 65 ? 65 : size.height * 0.07<45?45:size.height * 0.07) * 1.2,
              width: ((size.width -
                      (size.width * 0.5 > 15 ? 15 : size.width * 0.5))) /
                  5,
              decoration:
                  BoxDecoration(color: darkBlue4, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: FittedBox(child:Icon(Icons.send,color: Colors.white,),),
            ),
          ),
        ),
      ],
    );
  }
}
