import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/l10n/l10.dart';
import 'package:mohaseb/route/AppRouter.dart';
import 'package:mohaseb/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(child: const MyApp()));
}
final appRouter=AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
title: Strings.appName,
        supportedLocales: L10n.all,
        locale:
             const Locale("en"),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: mobileLightThemeData(),

        routerConfig: appRouter.config(
            deepLinkBuilder: (deepLink) {
              if (deepLink.path.startsWith('/products')) {
                // continute with the platfrom link
                return deepLink;
              } else {
                return DeepLink.defaultPath;
                // or DeepLink.path('/')
                // or DeepLink([HomeRoute()])
              }
            }
        ),

      ),
    );
  }
}


