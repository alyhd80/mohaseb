import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/utils/app_constant/route.dart';

class LoginViewModel extends ChangeNotifier {
  bool _changeSizeHeight=false;


  bool get changeSizeHeight => _changeSizeHeight;

  Future<void> findNavigationPage(
      BuildContext context,
      WidgetRef ref,
      ) async {

    if(_changeSizeHeight){
      _changeSizeHeight=false;
    }else{
      _changeSizeHeight=true;
    }

    print(_changeSizeHeight);
    notifyListeners();

  }






}

var loginViewModelProvider =
ChangeNotifierProvider.autoDispose<LoginViewModel>(
        (ref) => LoginViewModel());
