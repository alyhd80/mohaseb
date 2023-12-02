import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/login_with_password/view_model/login_with_password_view_model.dart';

@RoutePage(name: "login_with_password")
class LoginWithPasswordPage extends ConsumerStatefulWidget {
  const LoginWithPasswordPage({super.key});

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
                  child: viewModel.changeSizeHeight
                      ? null
                      : Container(
                          key: Key(viewModel.changeSizeHeight ? "on" : "off"),
                          width: size.width * 0.25,
                          height: size.height * 0.06,
                          child: CustomButton(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
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
