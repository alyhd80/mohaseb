import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/utils/app_constant/route.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> findNavigationPage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(context, AppRout.login, (_) => false);
    });
  }
}

var splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
        (ref) => SplashViewModel());
