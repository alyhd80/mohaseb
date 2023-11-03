import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/data/local/arguments.dart';
import 'package:mohaseb/screen/component/custom_buttom.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/login/component/login_body.dart';
import 'package:mohaseb/screen/login/view_model/login_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:mohaseb/utils/app_constant/route.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late LoginViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                              size.width * 0.07 > 30 ? 30 : size.width * 0.07,
                          fontWeight: FontWeight.w700,
                          color: primaryColor)),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                      "لطفا برای ورود به حساب کاربری خود، شماره موبایل خود را وارد کنید.",
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize:
                              size.width * 0.04 > 14 ? 14 : size.width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: greyFoundation06)),
                  SizedBox(
                    height: size.height * 0.01,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintTitle: "شماره موبایل",
                              hintColor: primaryColor,
                              textInputType: TextInputType.number,
                              textAlign: TextAlign.right,
                              maxCharacter: 11,
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
                              color: primaryColor,
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
                        fontWeight: FontWeight.w700,
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
                height: size.height * (viewModel.changeSizeHeight ? 1 :MediaQuery.of(context).viewInsets.bottom != 0?0.15 : 0.25),
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

                child:viewModel.changeSizeHeight?null :Container(
                  key: Key(viewModel.changeSizeHeight?"on":"off" ),
                  width: size.width * 0.25,
                  height: size.height * 0.06,
                  child: CustomButton(
                    onTap: () {
                      viewModel.findNavigationPage(context, ref);
                      Future.delayed(Duration(milliseconds: 500), () async {
                        await Navigator.of(context).pushNamed(AppRout.verify,
                            arguments:
                                LoginDetailArguments(phoneNumber: "09022783200"));
                        viewModel.findNavigationPage(context, ref);
                      });
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
    );
  }
}
