import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class BottomNavTabWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String urlSvg;
  final bool isSelectedPage;
  final Size size;

  const BottomNavTabWidget(
      {super.key,
      this.onTap,
      required this.isSelectedPage,
      required this.urlSvg,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        switchOutCurve: Curves.ease,
        switchInCurve: Curves.ease,
        child: Container(
          height: (size.height * 0.07 > 65
                  ? 65
                  : size.height * 0.07 < 45
                      ? 45
                      : size.height * 0.07) /
              2.2,
          key: Key(isSelectedPage ? "true" : "false"),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(
              urlSvg,
              color: isSelectedPage ? darkBlue4 : iconBasicColor,
            ),
          ),
        ),
      ),
    );
  }
}
