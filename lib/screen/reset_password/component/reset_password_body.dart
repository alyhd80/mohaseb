import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/reset_password/view_model/reset_password_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class ResetPasswordBody extends ConsumerWidget {
  final Size size;

  const ResetPasswordBody({super.key, required this.size});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var viewModel=ref.watch(resetPasswordViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("پسورد جدید را وارد کنید",   style: Theme.of(context).textTheme.headline2!.copyWith(
            color: textColorGrey2,
            fontSize:
            size.width * 0.035 > 13 ? 13 : size.width * 0.035),),
        SizedBox(
          height: size.height * 0.02>20?20:size.height * 0.02,
        ),
        Container(
          height: size.height * 0.075 < 45 ? 45 : size.height * 0.075,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                size.width * 0.04 > 15 ? 15 : size.width * 0.04,
                vertical: size.height * 0.015),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintTitle: "پسورد",
                    hintColor:primaryColor,
                    textEditingController: viewModel.password1TextEditingController,
                    textInputType: TextInputType.text,
                    textAlign: TextAlign.right,
                  showPassword: viewModel.showPassword1,
                  readOnly: viewModel.isLoading,
                    onChange: (string){

                      // if(string.isEmpty){
                      //   viewModel.notifierViewModel();
                      // }else if(string.length==1){
                      //   viewModel.notifierViewModel();
                      // }
                      //
                      // if(viewModel.isErrorValidation){
                      //   viewModel.isErrorValidation=false;
                      // }
                    },

                  ),
                ),
                SizedBox(
                  width: size.width * 0.03 > 15
                      ? 15
                      : size.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {

                    if (viewModel.showPassword1) {
                      viewModel.showPassword1 = false;
                    } else {
                      viewModel.showPassword1  = true;
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    child:
                    Consumer(builder: (context, ref, widget) {

                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        switchInCurve: Curves.ease,
                        switchOutCurve: Curves.ease,
                        child: AspectRatio(
                          key: Key(     viewModel.showPassword1  ? "true" : "false"),
                          aspectRatio: 1,
                          child: Icon(
                            !     viewModel.showPassword1
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: primaryColor,
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02>20?20:size.height * 0.02,
        ),
        Container(
          height: size.height * 0.075 < 45 ? 45 : size.height * 0.075,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                size.width * 0.04 > 15 ? 15 : size.width * 0.04,
                vertical: size.height * 0.015),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintTitle: "پسورد",
                    hintColor:primaryColor,
                    textEditingController: viewModel.password2TextEditingController,
                    textInputType: TextInputType.text,
                    textAlign: TextAlign.right,
                    readOnly: viewModel.isLoading,
                    showPassword: viewModel.showPassword2,

                    onChange: (string){

                    },

                  ),
                ),
                SizedBox(
                  width: size.width * 0.03 > 15
                      ? 15
                      : size.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {

                    if (viewModel.showPassword2) {
                      viewModel.showPassword2 = false;
                    } else {
                      viewModel.showPassword2  = true;
                    }
                  },
                  child: Container(
                    color: Colors.transparent,
                    child:
                    Consumer(builder: (context, ref, widget) {

                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        switchInCurve: Curves.ease,
                        switchOutCurve: Curves.ease,
                        child: AspectRatio(
                          key: Key(     viewModel.showPassword2  ? "true" : "false"),
                          aspectRatio: 1,
                          child: Icon(
                            !     viewModel.showPassword2
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: primaryColor,
                          ),
                        ),
                      );
                    }),
                  ),
                ),


              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02>20?20:size.height * 0.02,
        ),
        SizedBox(
          height: size.height * 0.06,
          width: size.width,
          child: Consumer(builder: (context, ref, wdiget) {
            return CustomButton(
              backgroundColor : primaryColor,
              isLoading: viewModel.isLoading,
              title: "ارسال رمز جدید",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              onTap: () {
                if(viewModel.isLoading)return;
                viewModel.checkValidationPassword(context: context, ref: ref);
              },
            );
          }),
        ),
      ],
    );
  }
}
