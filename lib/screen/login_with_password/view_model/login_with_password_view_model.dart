

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginWithPasswordViewModel extends ChangeNotifier {
  bool _changeSizeHeight = true;
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

}

var loginWithPasswordViewModelProvider = ChangeNotifierProvider.autoDispose<LoginWithPasswordViewModel>(
        (ref) => LoginWithPasswordViewModel());
