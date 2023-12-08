import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class ProfileTopWidget extends StatelessWidget {
  final Size size;

  const ProfileTopWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
          vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
      width: size.width,
      height: size.height * 0.35 > 350 ? 350 : size.height * 0.35<280?280:size.height * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: size.width * 0.4 > 250 ? 250 : size.width * 0.4,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: blueAppBar2,
                      borderRadius: BorderRadius.circular(16)),
                )),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Text(
                              "ویرایش",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: darkBlue4,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * 0.035 > 15
                                          ? 15
                                          : size.width * 0.035),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit,
                              color: darkBlue4,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "نام",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                  color:textColorGrey1,
                  fontSize: size.width*0.035>13?13:size.width*0.035
                ),
              ),
              Text(
                "امیر",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey2,
                    fontSize: size.width*0.055>18?18:size.width*0.055
                ),
              ),
              Text(
                "نام",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey1,
                    fontSize: size.width*0.035>13?13:size.width*0.035
                ),
              ),
              Text(
                "امیر",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey2,
                    fontSize: size.width*0.055>18?18:size.width*0.055
                ),
              ),
              Text(
                "نام",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey1,
                    fontSize: size.width*0.035>13?13:size.width*0.035
                ),
              ),
              Text(
                "امیر",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey2,
                    fontSize: size.width*0.055>18?18:size.width*0.055
                ),
              ),
              Text(
                "نام",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey1,
                    fontSize: size.width*0.035>13?13:size.width*0.035
                ),
              ),
              Text(
                "امیر",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey2,
                    fontSize: size.width*0.055>18?18:size.width*0.055
                ),
              ),
              Text(
                "نام",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey1,
                    fontSize: size.width*0.035>13?13:size.width*0.035
                ),
              ),
              Text(
                "امیر",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color:textColorGrey2,
                    fontSize: size.width*0.055>18?18:size.width*0.055
                ),
              ),

            ],
          )),
        ],
      ),
    );
  }
}
