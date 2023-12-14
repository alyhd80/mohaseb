import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String hintTitle;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final int? maxLine;
  final bool? showPassword, isAmount, isEnable, isSmartArticle, readOnly;
  final TextAlign? textAlign;
  final int? maxCharacter;
  final Function(String)? onChange, onSubmittedEnd;
  final String? Function(String? value)? validator;
  final double? fontSize;

  final Color? titleColor, hintColor;
  final TextInputAction? textInputAction;

  const CustomTextField({
    Key? key,
    required this.hintTitle,
    this.focusNode,
    this.textEditingController,
    this.textInputType,
    this.maxLine,
    this.showPassword = false,
    this.textAlign,
    this.maxCharacter,
    this.onChange,
    this.titleColor,
    this.isAmount = false,
    this.isEnable = true,
    this.textInputAction,
    this.isSmartArticle,
    this.onSubmittedEnd,
    this.hintColor,
    this.validator,
    this.readOnly,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextFormField(
      readOnly: readOnly ?? false,
      onFieldSubmitted: onSubmittedEnd,
      onChanged: onChange ?? (string) {},
      obscureText: showPassword ?? false,
      focusNode: focusNode,
      controller: textEditingController,
      maxLines: maxLine ?? 1,
      textAlign: textAlign ?? TextAlign.right,
      textInputAction: textInputAction ?? TextInputAction.send,
      enabled: isEnable,
      keyboardType:
          textInputType ?? const TextInputType.numberWithOptions(decimal: true),
      // validator: validator,
      inputFormatters: <TextInputFormatter>[
        if (isSmartArticle == true) ...[
          NumberTextInputFormatter(
            integerDigits: 1000,
            decimalDigits: 2,
            maxValue:
                '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.00000000000000000',
            decimalSeparator: '.',
            groupDigits: 3,
            groupSeparator: ',',
            allowNegative: false,
            // overrideDecimalPoint: true,
            // insertDecimalPoint: true,
            // insertDecimalDigits: true,
          ),
        ] else ...[
          if (maxCharacter != null) ...[
            LengthLimitingTextInputFormatter(maxCharacter),
          ],
          if (isAmount == true) ...[
            NumberTextInputFormatter(
              integerDigits: 1000,
              decimalDigits: 0,
              maxValue:
                  '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.00000000000000000',
              decimalSeparator: '.',
              groupDigits: 3,
              groupSeparator: ',',
              allowNegative: false,
              // overrideDecimalPoint: true,
              // insertDecimalPoint: true,
              // insertDecimalDigits: true,
            ),
          ] else ...[
            if (textInputType == TextInputType.number)
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]'),
              ),
          ]
        ]
      ],
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: fontSize != null
              ? fontSize == 14
                  ? size.width * 0.045 > 14
                      ? 14
                      : size.width * 0.045
                  : fontSize == 12
                      ? size.width * 0.045 > 12
                          ? 12
                          : size.width * 0.045
                      : fontSize == 18
                          ? size.width * 0.055 > 18
                              ? 18
                              : size.width * 0.055
                          : (size.width * 0.06 > size.height * 0.025
                                      ? size.height * 0.025
                                      : size.width * 0.06) >
                                  16
                              ? 16
                              : (size.width * 0.06 > size.height * 0.025
                                          ? size.height * 0.025
                                          : size.width * 0.06) <
                                      14
                                  ? 14
                                  : (size.width * 0.06 > size.height * 0.025
                                      ? size.height * 0.025
                                      : size.width * 0.06)
              : (size.width * 0.06 > size.height * 0.025
                          ? size.height * 0.025
                          : size.width * 0.06) >
                      16
                  ? 16
                  : (size.width * 0.06 > size.height * 0.025
                              ? size.height * 0.025
                              : size.width * 0.06) <
                          14
                      ? 14
                      : (size.width * 0.06 > size.height * 0.025
                          ? size.height * 0.025
                          : size.width * 0.06),
          fontWeight: FontWeight.w500,
          color: titleColor ?? iconsDark),
      decoration: InputDecoration.collapsed(
        hintText: hintTitle ?? " ",
        hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: fontSize != null
                ? fontSize == 14
                ? size.width * 0.045 > 14
                ? 14
                : size.width * 0.045
                : fontSize == 12
                ? size.width * 0.045 > 12
                ? 12
                : size.width * 0.045
                : fontSize == 18
                ? size.width * 0.055 > 18
                ? 18
                : size.width * 0.055
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06) >
                16
                ? 16
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06) <
                14
                ? 14
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06)
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06) >
                16
                ? 16
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06) <
                14
                ? 14
                : (size.width * 0.06 > size.height * 0.025
                ? size.height * 0.025
                : size.width * 0.06),
            fontWeight: FontWeight.w500,
            color: hintColor ?? greyFoundation09),
      ),
    );
  }
}

final numberFormat = NumberFormat.decimalPattern('#.###');

extension ExtOnNum on num {
  format() {
    final parts = toString().split('.');
    return '${numberFormat.format(num.tryParse(parts[0]) ?? 0.0)}.${parts[1]}';
  }
}
