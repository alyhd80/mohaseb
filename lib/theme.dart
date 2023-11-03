import 'package:flutter/material.dart';


ThemeData mobileLightThemeData() {
  return ThemeData.light().copyWith(

    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // backgroundColor: chatBackgroundColor ,
    // primaryColorDark: metallicPrimaryColor,
    cardColor: Colors.white,
    dividerColor: Colors.blueGrey.shade100.withOpacity(.5),
    appBarTheme: const AppBarTheme(color:Colors.white),
    iconTheme: IconThemeData(color: Colors.black.withOpacity(.7)),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color: Colors.black ,
      ),
      headline2: TextStyle(
        fontSize: 24.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color:  Colors.white ,
      ),
      headline3: TextStyle(
        fontSize: 18.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color:  Colors.black ,
      ),
      headline4: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color:  Colors.black ,
      ),
      headline5: TextStyle(
        fontSize: 13.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 11.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_faNum',
          fontWeight: FontWeight.w500,
          color: Colors.black),

      labelMedium: TextStyle(
          fontSize: 9.0,
          fontFamily: 'iran_sans_faNum',
          fontWeight: FontWeight.w300,
          color: Colors.black),
    ),

    hintColor: Colors.black.withOpacity(.4),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'iran_sans_faNum',
      ),
      errorStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'iran_sans_faNum',
      ),

      // contentPadding: const EdgeInsets.symmetric(
      //   // vertical: 14,
      //   horizontal: 16,
      // ),
      // filled: true,
    ),
    // colorScheme: ColorScheme.light(
    //     primary: backgroundDark, secondary: secondaryColor, error: errorColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme:
      IconThemeData(
        // color: primaryColor,

          size: 20),
      unselectedIconTheme:
      IconThemeData(color: Colors.black.withOpacity(.7), size: 20),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 12.0,
        fontFamily: 'iran_sans_faNum',
        fontWeight: FontWeight.w600,
        // color:primaryColor
      ),
      unselectedLabelStyle: TextStyle(
          fontSize: 12.0,
          fontFamily: 'iran_sans_faNum',
          fontWeight: FontWeight.w600,
          color:Colors.black.withOpacity(.7)),
    ),

  );
}

