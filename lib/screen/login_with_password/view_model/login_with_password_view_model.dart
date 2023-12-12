import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';
import 'package:auto_route/auto_route.dart';

class LoginWithPasswordViewModel extends ChangeNotifier {
  bool _changeSizeHeight = true;

  bool get changeSizeHeight => _changeSizeHeight;
  bool _showDownButton = false;
  bool _isLoading = false;

  bool _isLoadingSendOtp=false;

  bool get isLoadingSendOtp => _isLoadingSendOtp;

  bool get isLoading => _isLoading;

  bool get showDownButton => _showDownButton;
  TextEditingController passwordTextEditingController = TextEditingController();

  void refreshViewModel(bool show) {
    if (show == _showDownButton) return;
    print("set");
    _showDownButton = show;
    notifyListeners();
  }



  Future<void> findNavigationPage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (_changeSizeHeight) {
      _changeSizeHeight = false;
    } else {
      _changeSizeHeight = true;
    }
    print("login " + _changeSizeHeight.toString());
    notifyListeners();
  }

  Future<void> callApiToSendOTP(BuildContext context, WidgetRef ref,
      {required String phoneNumber}) async {
    _isLoadingSendOtp=true;
    notifyListeners();




    final response = await ref.read(apiClientProvider).login(
        context: context, map: {"phone": phoneNumber,  'wants_otp': '1'});


    if(response.isSuccess){
      showToast(
          context: context,
          title: "موفقیت",
          detail: "رمز یکبار مصرف با موفقیت برایتان ارسال شد",
          isSuccess: true);

      findNavigationPage(context, ref);
      await Future.delayed(Duration(milliseconds: 500), () async {
        await context.router.push(Verify(
          phoneNumber: phoneNumber,
          token: "response.data?.data?.otp?.signature" ?? "",
          dateTime: "response.data?.data?.otp?.expiredAt.toString()"??"",
        ));
        findNavigationPage(context, ref);

      });

    }else{
      showToast(
          context: context,
          title: "خطا",
          detail: response.errorResponseModel != null &&
              response.errorResponseModel!.message!.isNotEmpty
              ? response.errorResponseModel!.message!
              : Strings.unknownError,
          isSuccess: false);
    }

    _isLoadingSendOtp=false;
    notifyListeners();
  }
  Future<void> callApiToCheckPassword(BuildContext context, WidgetRef ref,
      {required String phoneNumber}) async {
    _isLoading = true;
    notifyListeners();

    final response = await ref.read(apiClientProvider).loginPassword(
        context: context,
        map: {
          "phone": phoneNumber,
          "password": passwordTextEditingController.text
        });

    if (response.isSuccess) {
      showToast(
          context: context,
          title: "موفقیت",
          detail: "ورود موفقعیت امیز - ابول بقیشو درست کنه اوک می کنم",
          isSuccess: true);
    } else {
      showToast(
          context: context,
          title: "خطا",
          detail: response.errorResponseModel != null &&
                  response.errorResponseModel!.message!.isNotEmpty
              ? response.errorResponseModel!.message!
              : Strings.unknownError,
          isSuccess: false);
    }

    _isLoading = false;
    notifyListeners();
  }
}

var loginWithPasswordViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginWithPasswordViewModel>(
        (ref) => LoginWithPasswordViewModel());

final loginPasswordShowPassword =
    StateProvider.autoDispose<bool>((ref) => false);
