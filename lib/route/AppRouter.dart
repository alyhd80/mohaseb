import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';


@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Splash.page, initial: true, path: "/splash"),
        CustomRoute(
          page: Login.page,
          path: "/login",
          transitionsBuilder: TransitionsBuilders.fadeIn,
// guards: [SplashGard()]
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


// class SplashGard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     print("rote --------------splash");
//     print(
//
//         resolver.route.args);
//
// print(resolver.route.pathParams);
// print(resolver.route.redirectedFrom);
//     if (resolver.route.args != null) {
//        // resolver.next(true);
//     } else {
//       ///web
//        router;
//        resolver.next(true);
//       ///mobile
//       ///router.pop();
//     }
//
//   }
// }