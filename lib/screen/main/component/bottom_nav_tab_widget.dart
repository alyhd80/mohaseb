import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class BottomNavTabWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData iconData;
  final bool isSelectedPage;

  const BottomNavTabWidget(
      {super.key,
      this.onTap,
      required this.iconData,
      required this.isSelectedPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        switchOutCurve: Curves.ease,
        switchInCurve: Curves.ease,
        
        child: Container(
          key: Key(isSelectedPage?"true":"false"),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: FittedBox(
            child: Icon(
              iconData,
              color: isSelectedPage ? darkBlue4 : iconBasicColor,
            ),
          ),
        ),
      ),
    );
  }
}
