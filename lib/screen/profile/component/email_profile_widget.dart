import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class EmailProfileWidget extends ConsumerWidget {
  final Size size;

  const EmailProfileWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(profileViewModelProvider);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),

      child: Container(
        key: Key(viewModel.isSuccess?"true":"off"),

        width: size.width,
        decoration: BoxDecoration(
            color:viewModel.isLoading?blueDevider :viewModel.isSuccess? Colors.white:redColor2,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
            vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "ایمیل",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color:viewModel.isSuccess? textColorGrey1:Colors.transparent,
                  fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
            ),
            SizedBox(
              height: size.height * 0.02 > 10
                  ? 10
                  : size.height * 0.02 < 5
                      ? 5
                      : size.width * 0.02,
            ),
            Consumer(builder: (contextt, ref, widget) {
              var viewModel = ref.watch(profileViewModelProvider);

              return AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                child: viewModel.isEditable
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: borderColor2),
                        ),
                        padding: EdgeInsets.only(bottom: 8, top: 8, left: 5),
                        child: CustomTextField(
                          hintTitle: "email",
                          fontSize: 14,
                          textAlign: TextAlign.left,
                          textEditingController: viewModel.emailEditingController,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: 9, bottom: 9, left: 6),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewModel.userProfileModel.data?.email??"",
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                              color:viewModel.isSuccess? titleColor1:Colors.transparent,
                              fontSize: size.width * 0.045 > 14
                                  ? 14
                                  : size.width * 0.045),
                        ),
                      ),
              );
            }),
            SizedBox(
              height: size.height * 0.02 > 10
                  ? 10
                  : size.height * 0.02 < 5
                      ? 5
                      : size.width * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
