


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/utils/app_constant/form_validator.dart';

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

}else if(FormValidator().passwordChecker(password2TextEditingController.text)!=null){
  _password2TextFieldTextTextFieldColor=false;
_password1TextFieldTextTextFieldColor=null;

}else if(password1TextEditingController.text!=password2TextEditingController.text){
  _password2TextFieldTextTextFieldColor=false;
  _password1TextFieldTextTextFieldColor=false;


}else{
  _password2TextFieldTextTextFieldColor=null;
  _password1TextFieldTextTextFieldColor=null;
}

  }
  Future<void> _callApiToSetPassword({required BuildContext context,required WidgetRef ref,}
      ) async {

  }


}

var resetPasswordViewModelProvider = ChangeNotifierProvider.autoDispose<ResetPasswordViewModel>(
        (ref) => ResetPasswordViewModel());