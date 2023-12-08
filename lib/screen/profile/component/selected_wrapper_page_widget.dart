import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class SelectedWrapperPageWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Size size;
final bool isSelected;
  const SelectedWrapperPageWidget(
      {super.key, required this.size, required this.title, this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.ease,
          child: Container(
            key: Key(isSelected?"true":"false"),
            decoration: BoxDecoration(
              color:isSelected?darkBlue4 :Colors.transparent,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color:isSelected?Colors.white :darkBlue4,
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.045 > 13 ? 13 : size.width * 0.045),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
