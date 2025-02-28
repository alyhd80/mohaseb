import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
size: size,
                  isSelectedPage: viewModel.pageSelected == 3,
                  onTap: () {
                    viewModel.pageSelected = 3;
                  }, urlSvg: 'assets/images/profile_bottom_nav.svg',
                )),
                Expanded(
                    child: BottomNavTabWidget(size: size,
                  isSelectedPage: viewModel.pageSelected == 2,
                  onTap: () {
                    viewModel.pageSelected = 2;
                  }, urlSvg: 'assets/images/resume_nav_bar.svg',
                )),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                    child: BottomNavTabWidget(size: size,
                  isSelectedPage: viewModel.pageSelected == 1,
                  onTap: () {
                    viewModel.pageSelected = 1;
                  },
                        urlSvg: 'assets/images/search_bottom_nav.svg'                )),
                Expanded(
                    child: BottomNavTabWidget(size: size,
                  isSelectedPage: viewModel.pageSelected == 0,
                  onTap: () {
                    viewModel.pageSelected = 0;
                  }, urlSvg: 'assets/images/home_bottom_nav.svg',
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
              child: Container(
    height: ((size.height * 0.07 > 65 ? 65 : size.height * 0.07<45?45:size.height * 0.07) * 0.4),child: AspectRatio(aspectRatio: 1,child:SvgPicture.asset("assets/images/send_bottom_nav.svg"),)),
            ),
          ),
        ),
      ],
    );
  }
}
