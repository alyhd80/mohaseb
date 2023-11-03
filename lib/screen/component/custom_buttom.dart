import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class CustomButton extends StatelessWidget {
  final Key? key;
  final Color? backgroundColor, titleColor;
  final String title;
  final bool? isLoading;
  final VoidCallback? onTap;
  final IconData? iconData;
  final Color? iconColor, borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final String? loadingUrl;

  const CustomButton(
      {this.backgroundColor,
      this.titleColor = Colors.white,
      required this.title,
      this.isLoading = false,
      this.onTap,
      this.iconData,
      this.iconColor,
      this.fontWeight,
      this.borderColor,
      this.fontSize,
      this.loadingUrl,
      this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // height: 0,
          // width: 0,
          decoration: BoxDecoration(
              color: backgroundColor ?? blueAzure,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor ?? Colors.transparent)),
          alignment: isLoading == true ? null : Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical:
                  isLoading == true ? size.height * 0.00 : size.height * 0.012),
          child: Container(
              alignment: Alignment.center,
              child: isLoading == true
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: FittedBox(
                        child: Lottie.asset(
                            "assets/animations/App_store_Secondary_btn_loading.json"),
                      ),
                    )
                  : iconData != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Icon(
                                iconData,
                                color: iconColor ?? titleColor ?? Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03 > 15
                                  ? 15
                                  : size.width * 0.03,
                            ),
                            FittedBox(
                              child: Text(
                                title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: titleColor ?? Colors.white,
                                        fontSize: size.width * 0.046 > 16
                                            ? 16
                                            : size.width * 0.046,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )
                      : FittedBox(
                          child: Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                    color: titleColor ?? Colors.white,
                                    fontSize: fontSize == null
                                        ? size.width * 0.046 > 18
                                            ? 18
                                            : size.width * 0.046
                                        : (fontSize == 14.0)
                                            ? size.width * 0.045 > 14
                                                ? 14
                                                : size.width * 0.045
                                            : fontSize == 16
                                                ? size.width * 0.045 > 16
                                                    ? 16
                                                    : size.width * 0.045
                                                : size.width * 0.046,
                                    fontWeight: fontWeight ?? FontWeight.w500),
                          ),
                        )),
        ),
      ),
    );
  }
}
