

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';

class LoginWithPasswordViewModel extends ChangeNotifier {
  bool _changeSizeHeight = true;
  bool get changeSizeHeight => _changeSizeHeight;
  bool _showDownButton=false;
bool _isLoading=false;

  bool get isLoading => _isLoading;

  bool get showDownButton => _showDownButton;

  void refreshViewModel(bool show){
    if(show==_showDownButton)return;
print("set");
    _showDownButton=show;
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

  TextEditingController passwordTextEditingController=TextEditingController();




  Future<void> callApiToCheckPassword(
      BuildContext context,
      WidgetRef ref,
      {required String phoneNumber}

      ) async {
    _isLoading=true;
    notifyListeners();

    final response = await ref.read(apiClientProvider).loginPassword(
        context: context, map: {"phone": phoneNumber,
    "password":passwordTextEditingController.text});




    _isLoading=false;
    notifyListeners();
  }


}

var loginWithPasswordViewModelProvider = ChangeNotifierProvider.autoDispose<LoginWithPasswordViewModel>(
        (ref) => LoginWithPasswordViewModel());


final loginPasswordShowPassword =
StateProvider.autoDispose<bool>((ref) => false);