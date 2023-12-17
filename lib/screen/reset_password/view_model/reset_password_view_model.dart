


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/form_validator.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';
import 'package:auto_route/auto_route.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  bool _isLoading=false;
  bool _showPassword1=true;
  bool _showPassword2=true;
  bool? _password1TextFieldTextTextFieldColor;
  bool? _password2TextFieldTextTextFieldColor;


  bool get showPassword1 => _showPassword1;

  set showPassword1(bool value) {
    _showPassword1 = value;
    notifyListeners();
  }

  TextEditingController password1TextEditingController=TextEditingController();
  TextEditingController password2TextEditingController=TextEditingController();

  bool get isLoading => _isLoading;

  bool get showPassword2 => _showPassword2;

  set showPassword2(bool value) {
    _showPassword2 = value;
    notifyListeners();
  }


  Future<void> checkValidationPassword({required BuildContext context,required WidgetRef ref,}
    ) async {

if(FormValidator().passwordChecker(password1TextEditingController.text)!=null){
  _password1TextFieldTextTextFieldColor=false;
return;
}else if(FormValidator().passwordChecker(password2TextEditingController.text)!=null){
  _password2TextFieldTextTextFieldColor=false;
_password1TextFieldTextTextFieldColor=null;

  return;

}else if(password1TextEditingController.text!=password2TextEditingController.text){
  _password2TextFieldTextTextFieldColor=false;
  _password1TextFieldTextTextFieldColor=false;

  return;

}else{
  _password2TextFieldTextTextFieldColor=null;
  _password1TextFieldTextTextFieldColor=null;
  _callApiToSetPassword(context: context, ref: ref);
}

  }
  Future<void> _callApiToSetPassword({required BuildContext context,required WidgetRef ref,}
      ) async {
    _isLoading=true;
    notifyListeners();


    final response = await ref
        .read(apiClientProvider)
        .setNewPassword(context: context, map: {"password": password1TextEditingController.text, 'password_confirmation': password2TextEditingController.text});

    if(response.isSuccess){
      context.router.pop();
      showToast(context: context, title: "موفقیت", detail: "پسورد با موفقیت تغییر کرد", isSuccess: true);

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

    _isLoading=false;
    notifyListeners();
  }



}

var resetPasswordViewModelProvider = ChangeNotifierProvider.autoDispose<ResetPasswordViewModel>(
        (ref) => ResetPasswordViewModel());