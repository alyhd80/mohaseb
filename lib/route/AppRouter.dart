import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/screen/login_with_password/login_with_password_page.dart';
import 'package:mohaseb/screen/main/main_page.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Splash.page, initial: true, path: "/splash"),
        CustomRoute(
          page: Login.page,
          path: "/login",
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
    CustomRoute(
      page: Verify.page,
      path: "/verify/:phoneNumber/:token/",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page:Login_with_password.page,
      path: "/login_with_password/",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page:Main.page,
      path: "/main/",
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
      ];
}

class SecondGard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(resolver.route.args);

    if (resolver.route.args != null) {
      resolver.next(true);
    } else {
      ///web
      router.back();

      ///mobile
      ///router.pop();
    }
  }
}
