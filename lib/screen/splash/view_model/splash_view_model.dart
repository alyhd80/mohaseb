import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/screen/login/login_page.dart';
import 'package:mohaseb/utils/app_constant/route.dart';
import 'package:auto_route/auto_route.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> findNavigationPage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    Future.delayed(Duration(seconds: 1), () async {

      final pref = ref.read(appPreferenceHelperProvider);
      final loginMode = await pref.getUserLoggedInMode();

      if (loginMode == 0) {
        context.router.pushAndPopUntil(Login(),predicate: (t){
          return false;
        });
      } else {
        context.router.pushAndPopUntil(Main(),predicate: (t){
          return false;
        });
      }
    });
  }
}

var splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
        (ref) => SplashViewModel());
