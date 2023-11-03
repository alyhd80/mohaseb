import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPineCodeWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChange;
  final Color? borderColor;

  const VerifyPineCodeWidget({Key? key, required this.textEditingController,  this.onChange, this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return    Directionality(

      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        animationCurve: Curves.easeIn,
        onChanged: onChange!,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(16),
          fieldHeight: size.height * 0.065,
          fieldWidth: size.width * 0.17,
          activeFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          inactiveColor:borderColor?? borderColor1,
          selectedColor:borderColor?? blueAzure,
          activeColor:borderColor??borderColor1,

        ),
        animationType: AnimationType.fade,

        enableActiveFill: true,
        appContext: context,
        length: 4,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(5),
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
        ],
      ),
    );
  }
}
