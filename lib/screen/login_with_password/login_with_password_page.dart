import 'package:boxicons/boxicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/login_with_password/view_model/login_with_password_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import "package:universal_html/html.dart" as html;

@RoutePage(name: "login_with_password")
class LoginWithPasswordPage extends ConsumerStatefulWidget {
  final String phoneNumber;

  const LoginWithPasswordPage(
      {super.key, @pathParam required this.phoneNumber});

  @override
  ConsumerState<LoginWithPasswordPage> createState() =>
      _LoginWithPasswordPageState();
}

class _LoginWithPasswordPageState extends ConsumerState<LoginWithPasswordPage> {
  late LoginWithPasswordViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.findNavigationPage(context, ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    viewModel = ref.watch(loginWithPasswordViewModelProvider);

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          viewModel.findNavigationPage(context, ref);
          Future.delayed(Duration(milliseconds: 500), () async {
            Navigator.of(context).pop();
            viewModel.findNavigationPage(context, ref);
          });
          return false;
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("رمز ورود",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: size.width * 0.095 > 40
                                ? 40
                                : size.width * 0.095,
                            fontWeight: FontWeight.w500,
                            color: primaryColor)),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "لطفا برای ورود، رمز عبور خود را که پیش از این ایجاد کرده اید را وارد کنید.",
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: size.width * 0.045 > 16
                                ? 16
                                : size.width * 0.045,
                            fontWeight: FontWeight.w500,
                            color: greyFoundation06)),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height:
                          size.height * 0.075 < 45 ? 45 : size.height * 0.075,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2),
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
                              child: Consumer(builder: (context, ref, widget) {
                                bool showPassword =
                                    ref.watch(loginPasswordShowPassword);

                                return CustomTextField(
                                  hintTitle: "رمز ورود ",
                                  hintColor: primaryColor,
                                  textEditingController:
                                      viewModel.passwordTextEditingController,
                                  showPassword: showPassword,
                                  textAlign: TextAlign.right,
                                  readOnly: viewModel.isLoading,
                                  textInputType: TextInputType.text,
                                  onChange: (string) {


if(string.length<8){
  viewModel.refreshViewModel(false);
}else{
  viewModel.refreshViewModel(true);
}


                                  },
                                );
                              }),
                            ),
                            SizedBox(
                              width: size.width * 0.03 > 15
                                  ? 15
                                  : size.width * 0.03,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (ref.read(loginPasswordShowPassword) ==
                                    true) {
                                  ref
                                      .read(loginPasswordShowPassword.notifier)
                                      .state = false;
                                } else {
                                  ref
                                      .read(loginPasswordShowPassword.notifier)
                                      .state = true;
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child:
                                    Consumer(builder: (context, ref, widget) {
                                  bool showPassword =
                                      ref.watch(loginPasswordShowPassword);
                                  return AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    switchInCurve: Curves.ease,
                                    switchOutCurve: Curves.ease,
                                    child: AspectRatio(
                                      key: Key(showPassword ? "true" : "false"),
                                      aspectRatio: 1,
                                      child: Icon(
                                        !showPassword
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
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                      width: size.width,
                      child: Consumer(builder: (context, ref, wdiget) {
                        return CustomButton(
                          titleColor: primaryColor,
                          backgroundColor: Colors.transparent,
                          title: "ورود از طریق ازسال پیامک یک بار مصرف",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          onTap: () {},
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
                    horizontal: size.width * 0.02,
                    vertical: size.height * 0.02),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  switchInCurve: Curves.ease,
                  switchOutCurve: Curves.ease,
                  child: viewModel.changeSizeHeight || !viewModel.showDownButton
                      ? null
                      : Container(
                          key: Key(viewModel.changeSizeHeight  || !viewModel.showDownButton ? "on" : "off"),
                          width: size.width * 0.25,
                          height: size.height * 0.06,
                          child: CustomButton(
                            onTap: () {
                              if(!viewModel.isLoading)
                         viewModel.callApiToCheckPassword(context, ref,phoneNumber: widget.phoneNumber);
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
      ),
    );
  }
}
