import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/login/view_model/login_view_model.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: "login")
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    viewModel = ref.watch(loginViewModelProvider);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("ورود",
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize:
                              size.width * 0.095 > 40 ? 40 : size.width * 0.095,
                          fontWeight: FontWeight.w500,
                          color: primaryColor)),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                      "لطفا برای ورود به حساب کاربری خود، شماره موبایل خود را وارد کنید.",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize:
                              size.width * 0.045 > 16 ? 16 : size.width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: greyFoundation06)),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.075 < 45 ? 45 : size.height * 0.075,
                    decoration: BoxDecoration(
                        border: Border.all(color:viewModel.isErrorValidation? redColor1: primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              size.width * 0.04 > 15 ? 15 : size.width * 0.04,
                          vertical: size.height * 0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintTitle: "شماره موبایل",
                              hintColor:primaryColor,
                              textEditingController: viewModel.numberTextEditingController,
                              textInputType: TextInputType.number,
                              textAlign: TextAlign.right,
                              maxCharacter: 11,
                              onChange: (string){

                                if(string.isEmpty){
                                  viewModel.notifierViewModel();
                                }else if(string.length==1){
                                  viewModel.notifierViewModel();
                                }

                                if(viewModel.isErrorValidation){
                                  viewModel.isErrorValidation=false;
                                }
                              },

                            ),
                          ),
                          SizedBox(
                            width:
                                size.width * 0.03 > 15 ? 15 : size.width * 0.03,
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: Icon(
                              Boxicons.bx_phone,
                              color:viewModel.isErrorValidation? redColor1: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width,
                    child: Consumer(builder: (context, ref, wdiget) {
                      return CustomButton(
                        titleColor: primaryColor,
                        backgroundColor: Colors.transparent,
                        title: "ورود با نام کاربری و رمز عبور",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        onTap: () {
 viewModel.navigationToLoginWithPassword(context, ref);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: size.width,
              height: size.height *
                  (viewModel.changeSizeHeight
                      ? 1
                      : MediaQuery.of(context).viewInsets.bottom != 0
                          ? 0.1625
                          : 0.25),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/images/login_2.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
             child: Image.asset(
              "assets/images/login_2.png",
              fit: BoxFit.fill,
            ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: size.width,
                height: size.height *
                    (viewModel.changeSizeHeight
                        ? 1
                        : MediaQuery.of(context).viewInsets.bottom != 0
                            ? 0.125
                            : 0.1875),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //   image: AssetImage("assets/images/login_1.png"),
                //   fit: BoxFit.fill,
                // )),
                child: Image.asset(
                  "assets/images/login_1.png",
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: size.width,
                height: size.height *
                    (viewModel.changeSizeHeight
                        ? 1
                        : MediaQuery.of(context).viewInsets.bottom != 0
                            ? 0.15
                            : 0.25),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //   image: AssetImage("assets/images/login_3.png"),
                //   fit: BoxFit.fill,
                // )),
                child: Image.asset(
                  "assets/images/login_3.png",
                  fit: BoxFit.fill,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.02),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                switchInCurve: Curves.ease,
                switchOutCurve: Curves.ease,
                child: (viewModel.changeSizeHeight||viewModel.numberTextEditingController.text.isEmpty)
                    ? null
                    : Container(
                        key: Key( (viewModel.numberTextEditingController.text.isEmpty||viewModel.changeSizeHeight) ? "on" : "off"),
                        width: size.width * 0.25,
                        height: size.height * 0.06,
                        child: CustomButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();

                            if(viewModel.isLoading){
                              showToast(context: context, title: "خطا", detail: "درخواست قبلی در حال اجرا می باشد", isSuccess: false);
                              return;
                            }
                            viewModel.validation(context, ref);

                          },
                          isLoading: viewModel.isLoading,
                          title: "بعدی",
                          borderColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
