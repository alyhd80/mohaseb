import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:mohaseb/screen/setting/component/setting_feature_widget.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:auto_route/auto_route.dart';

class SettingBody extends StatelessWidget {
  final Size size;

  const SettingBody({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02 > 15 ? 15 : size.height * 0.02,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
              vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),

          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Icon(
                            Boxicons.bx_arrow_back,
                            size: 20,
                            color: titleColor1,
                          ))),
                  Text(
                    "تنظیمات",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: darkBlue4,
                        fontWeight: FontWeight.w500,
                        fontSize:
                            size.width * 0.035 > 13 ? 13 : size.width * 0.035),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01 > 15 ? 15 : size.height * 0.01,
              ),
              Container(
                width: size.width,
                height: 1,
                decoration: BoxDecoration(color: borderColor2),
              ),
              SizedBox(
                height: size.height * 0.01 > 15 ? 15 : size.height * 0.01,
              ),
SettingFeatureWidget(size: size, iconData: Boxicons.bx_lock, title: "بازیابی رمز عبور"),
              SizedBox(height: size.height*0.5,)
            ],
          ),
        ),
      ],
    );
  }
}
