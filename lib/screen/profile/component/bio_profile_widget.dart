import 'package:flutter/material.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class BioProfileWidget extends StatelessWidget {
  final Size size;

  const BioProfileWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
          vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "بیو",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: titleColor1,
                fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
          ),
          SizedBox(
            height: size.height * 0.02 > 10
                ? 10
                : size.height * 0.02 < 5
                    ? 5
                    : size.width * 0.02,
          ),
          Text(
            "نرم افزار محاسب 2000، نرم افزار نوین نقشه کشی مهندسی عمران است که طرح و برنامه نویسی آن توسط مهندس محمود محمودی انجام شده است و روز به روز بر توانایی هایی های آن افزوده می شود. در حقیقت یکی از است.",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: titleColor1,
                fontSize: size.width * 0.045 > 12 ? 12 : size.width * 0.045),
          ),

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
