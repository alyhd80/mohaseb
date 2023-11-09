import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/screen/login/login_page.dart';
import 'package:mohaseb/utils/app_constant/route.dart';
import 'package:auto_route/auto_route.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> findNavigationPage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    Future.delayed(Duration(seconds: 1), () {
      context.router.replace(Login());
      // Navigator.pushNamedAndRemoveUntil(context, AppRout.login, (_) => false);
    });
  }
}

var splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
        (ref) => SplashViewModel());
