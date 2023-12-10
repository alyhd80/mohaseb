import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class EmailProfileWidget extends StatelessWidget {
  final Size size;

  const EmailProfileWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
          vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "ایمیل",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: titleColor1,
                fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
          ),
          SizedBox(height: size.height*0.02>10?10:size.height*0.02<5?5:size.width*0.02,),

          Container(alignment: Alignment.centerLeft,
            child: Text("booleannemati@gmail.com",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: titleColor1,
                  fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),),
          ),
          SizedBox(height: size.height*0.02>10?10:size.height*0.02<5?5:size.width*0.02,),

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
    );
  }
}
