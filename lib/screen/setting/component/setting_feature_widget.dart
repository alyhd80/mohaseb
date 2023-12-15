import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class SettingFeatureWidget extends StatelessWidget {
  final Size size;
  final IconData iconData;
  final String title;
  final VoidCallback? onTap;

  const SettingFeatureWidget(
      {super.key,
      required this.size,
      required this.iconData,
      required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,            style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(
              color: textColorGrey1,
              fontWeight: FontWeight.w500,
              fontSize: size.width * 0.035 > 13
                  ? 13
                  : size.width * 0.035)),
            SizedBox(width: size.width*0.03>10?10:size.width*0.03,),

            Icon(iconData,color: Colors.black,size: 20,),


          ],
        ),
      ),
    );
  }
}
