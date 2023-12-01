import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/data/local/arguments.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/verify/component/verify_pine_code_widget.dart';
import 'package:mohaseb/screen/verify/view_model/timer.dart';
import 'package:mohaseb/screen/verify/view_model/verify_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage(name: "verify")
class VerifyPage extends ConsumerStatefulWidget {
  final String phoneNumber,token;
  const VerifyPage({super.key,@pathParam required this.phoneNumber,@pathParam required this.token});

  @override
  ConsumerState<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends ConsumerState<VerifyPage> {
  late VerifyViewModel viewModel;

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


    viewModel = ref.watch(verifyViewModelProvider);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(

        onWillPop: () async{
          FocusScope.of(context).unfocus();

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
                    Text("ورود",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize:
                                size.width * 0.095 > 40 ? 40 : size.width * 0.095,
                            fontWeight: FontWeight.w500,
                            color: primaryColor)),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text.rich(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      TextSpan(
                          text:
                              "لطفا برای ورود، رمز یکبار مصرف ارسال شده به شماره ",
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: size.width * 0.045 > 16
                                  ? 16
                                  : size.width * 0.045,
                              fontWeight: FontWeight.w500,
                              color: borderColor1),
                          children: [
                            TextSpan(
                              text:  widget.phoneNumber??"",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      fontSize: size.width * 0.045 > 16
                                          ? 16
                                          : size.width * 0.045,
                                      fontWeight: FontWeight.w500,
                                      color: darkBlue2),
                            ),
                            TextSpan(
                              text: " را وارد کنید.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      fontSize: size.width * 0.045 > 16
                                          ? 16
                                          : size.width * 0.045,
                                      fontWeight: FontWeight.w500,
                                      color: borderColor1),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    VerifyPineCodeWidget(
                        textEditingController: viewModel.pinCodeTextEditingController,
                        onChange: (string) {


                          if(string.length==4){
viewModel.callApiToVerify(context, ref, phoneNumber:widget. phoneNumber, token:widget. token);
                          }

                        }),
                    Consumer(builder: (context, ref, widget) {
                      var viewModelTimer = ref.watch(timerViewModelProvider);

                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.2),
                        height: size.height * 0.07 < 40 ? 40 : size.height * 0.07,
                        alignment:
                            viewModelTimer.time == 0 ? null : Alignment.center,
                        width: size.width,
                        child: viewModelTimer.time == 0
                            ? CustomButton(
                                title: "ارسال مجدد",
                                fontWeight: FontWeight.w500,
                                titleColor: blueAzure,
                                fontSize: 16,
                                backgroundColor: Colors.transparent,
                                onTap: () {},
                              )
                            : AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Text(
                                  "${(viewModelTimer.time / 60).toInt()}:${(viewModelTimer.time % 60) == 0 ? "00" : (viewModelTimer.time % 60)}",
                                  key: ValueKey<String>(
                                      viewModelTimer.time.toString()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: darkBlue2,
                                          fontSize: size.width * 0.05 > 18
                                              ? 18
                                              : size.width * 0.04),
                                ),
                              ),
                      );
                    }),
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
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new AssetImage("assets/images/login_2.png"),
                    fit: BoxFit.fill,
                  ))),
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
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new AssetImage("assets/images/login_1.png"),
                    fit: BoxFit.fill,
                  ))),
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
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new AssetImage("assets/images/login_3.png"),
                    fit: BoxFit.fill,
                  ))),
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
                  child: viewModel.changeSizeHeight
                      ? null
                      : Container(
                          key: Key(viewModel.changeSizeHeight ? "on" : "off"),
                          width: size.width * 0.25,
                          height: size.height * 0.06,
                          child: CustomButton(
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              // viewModel.findNavigationPage(context, ref);
                              context.router.pop();
                            },
                            title: "قبلی",
                            isLoading: viewModel.isLoading,
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
