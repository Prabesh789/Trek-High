import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AppThemes {
  /*Getter to get Palatte for light theme*/
  static final lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(fillColor: Colors.white),
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigoAccent.withOpacity(0.9),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.indigo[50],
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(
      color: Colors.black.withOpacity(0.8),
    ),
    dialogTheme: const DialogTheme(backgroundColor: Colors.red),
    fontFamily: 'PT Serif',
    brightness: Brightness.light,
    focusColor: Colors.black.withOpacity(0.3),
    canvasColor: Colors.grey,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFFFFFFFF),
    cardColor: Colors.indigo[50],
    bottomAppBarColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 35,
      ),
      headline2: const TextStyle(
        fontSize: 30,
      ),
      headline3: const TextStyle(
        fontSize: 25,
      ),
      headline4: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      ),
      headline5: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      headline6: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.black,
      ),
      subtitle1: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      subtitle2: const TextStyle(
        fontSize: 10,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.grey.shade800,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.grey.shade700,
      ),
      button: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      caption: const TextStyle(
        fontSize: 13,
      ),
      overline: const TextStyle(
        fontSize: 8,
      ),
    ),
  );

  /*Getter to get Palatte for light theme*/
  static final darkTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(fillColor: Colors.grey[400]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.indigoAccent.withOpacity(1),
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0.3)),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.3),
    ),
    fontFamily: 'PT Serif',
    dialogTheme: const DialogTheme(backgroundColor: Colors.red),
    brightness: Brightness.dark,
    canvasColor: Colors.grey,
    focusColor: Colors.white.withOpacity(0.3),
    scaffoldBackgroundColor: const Color(0xFF2f2f34),
    backgroundColor: const Color(0xFF0A1A1E),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: Colors.green,
    dividerColor: const Color(0x1CFFFFFF),
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 35,
      ),
      headline2: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline3: const TextStyle(
        fontSize: 25,
      ),
      headline4: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
      headline5: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      headline6: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.white,
      ),
      subtitle1: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      subtitle2: const TextStyle(
        fontSize: 10,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.grey.shade100,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: Colors.grey.shade200,
      ),
      button: const TextStyle(
        fontSize: 16,
      ),
      caption: const TextStyle(
        fontSize: 13,
      ),
      overline: const TextStyle(
        fontSize: 8,
      ),
    ),
  );
}
