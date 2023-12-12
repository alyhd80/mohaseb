import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';
import 'package:mohaseb/utils/form_validator.dart';
import 'package:auto_route/auto_route.dart';

class LoginViewModel extends ChangeNotifier {
  bool _changeSizeHeight = false;
  bool _isErrorValidation = false;

  void notifierViewModel() {
    notifyListeners();
  }

  TextEditingController numberTextEditingController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get isErrorValidation => _isErrorValidation;

  bool get changeSizeHeight => _changeSizeHeight;

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

  set isErrorValidation(bool value) {
    _isErrorValidation = value;
    notifyListeners();
  }

  Future<void> validation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (FormValidator().mobileValid(numberTextEditingController.text) != null) {
      showToast(
          context: context,
          title: "شماره موبایل صحیح نمی باشد",
          detail:
              FormValidator().mobileValid(numberTextEditingController.text)!,
          isSuccess: false);

      _isErrorValidation = true;
      notifyListeners();
    } else {
      _isErrorValidation = false;
      notifyListeners();
      callApi(context, ref);
    }
  }

  Future<void> callApi(
    BuildContext context,
    WidgetRef ref,
  ) async {
    _isLoading = true;
    notifyListeners();

    final response = await ref.read(apiClientProvider).login(
        context: context, map: {"phone": numberTextEditingController.text});

    if (response.isSuccess) {
      showToast(
          context: context,
          title: "موفقیت",
          detail: "رمز یکبار مصرف با موفقیت برایتان ارسال شد",
          isSuccess: true);

      findNavigationPage(context, ref);

      if (response.data!.hasPassword!) {
        await Future.delayed(Duration(milliseconds: 500), () async {
          await context.router.push(Login_with_password(phoneNumber:  numberTextEditingController.text));

          findNavigationPage(context, ref);
        });
      } else {
        await Future.delayed(Duration(milliseconds: 500), () async {
          await context.router.push(Verify(
              phoneNumber: numberTextEditingController.text,
              token: response.data?.data?.otp?.signature ?? "",
            dateTime: response.data?.data?.otp?.expiredAt.toString()??"",
          ));

          findNavigationPage(context, ref);
        });
      }
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

var loginViewModelProvider = ChangeNotifierProvider.autoDispose<LoginViewModel>(
    (ref) => LoginViewModel());
