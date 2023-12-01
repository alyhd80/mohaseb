import 'package:boxicons/boxicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

void showToast(
    {required BuildContext context,
    required String title,
    required String detail,
    required bool? isSuccess}) {
  Size size = MediaQuery.of(context).size;
  FToast toast = FToast();
  toast.init(context);
  toast.removeQueuedCustomToasts();
  toast.showToast(
      gravity: ToastGravity.TOP,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: isSuccess == true
              ? greenColor
              : isSuccess == false
                  ? foundationRedValencia
                  : primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      (size.width * 0.008 < 5.25 ? 5.25 : size.width * 0.008) *
                          1.5,
                  vertical: (size.height * 0.008 < 5.25
                          ? 5.25
                          : size.height * 0.008) *
                      2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.045 < 32
                        ? 32
                        : size.height * 0.045 > 40
                            ? 40
                            : size.height * 0.045,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: (size.height * 0.008 < 5.25
                                ? 5.25
                                : size.height * 0.008)),
                        child: FittedBox(
                          child: Icon(
                            isSuccess == true
                                ? Boxicons.bx_check_circle
                                : Boxicons.bxs_error,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(title,
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: size.width * 0.04 > 16
                                      ? 16
                                      : size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                  GestureDetector(
                    onTap: () {
                      toast.removeCustomToast();
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: size.height * 0.045 < 32
                          ? 32
                          : size.height * 0.045 > 40
                              ? 40
                              : size.height * 0.045,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: (size.height * 0.008 < 5.25
                                  ? 5.25
                                  : size.height * 0.008)),
                          child: FittedBox(
                            child: Icon(
                              Boxicons.bx_x,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.5, right: 2.5, left: 2.5),
              child: Container(
                alignment: (detail.contains("a"))?Alignment.centerLeft :Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: (size.width * 0.008 < 5.25
                            ? 5.25
                            : size.width * 0.008) *
                        2.5,
                    vertical: (size.height * 0.008 < 5.25
                            ? 5.25
                            : size.height * 0.008) *
                        2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16))),
                child: Text(detail,
                    textDirection:
                    (detail.contains("a"))?TextDirection.ltr:TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize:
                            size.width * 0.03 > 12 ? 12 : size.width * 0.03,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
            )
          ],
        ),
      ));
}
