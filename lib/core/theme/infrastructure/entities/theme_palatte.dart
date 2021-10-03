import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AppThemes {
  /// Colors from Tailwind CSS
  ///
  /// https://tailwindcss.com/docs/customizing-colors

  static const int _primaryColor = 0xFF6366F1;
  static const MaterialColor primarySwatch =
      MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFECEDFD),
    100: Color(0xFFD0D1FB),
    200: Color(0xFFB1B3F8),
    300: Color(0xFF9294F5),
    400: Color(0xFF7A7DF3),
    500: Color(_primaryColor),
    600: Color(0xFF5B5EEF),
    700: Color(0xFF5153ED),
    800: Color(0xFF4749EB),
    900: Color(0xFF3538E7),
  });

  static const int _textColor = 0xFF6B7280;
  static const MaterialColor textSwatch = MaterialColor(
    _textColor,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DB),
      400: Color(0xFF9CA3AF),
      500: Color(_textColor),
      600: Color(0xFF4B5563),
      700: Color(0xFF374151),
      800: Color(0xFF1F2937),
      900: Color(0xFF111827),
    },
  );

  /*Getter to get Palatte for light theme*/
  static final lightTheme = ThemeData(
    fontFamily: 'Avenir Next',
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: textSwatch.shade100,
    backgroundColor: textSwatch.shade100,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: textSwatch.shade700,
        fontWeight: FontWeight.w300,
        fontSize: 35,
      ),
      headline2: TextStyle(
        color: textSwatch.shade600,
        fontSize: 30,
      ),
      headline3: TextStyle(
        color: textSwatch.shade700,
        fontSize: 25,
      ),
      headline4: TextStyle(
        color: textSwatch.shade700,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline5: TextStyle(
        color: textSwatch.shade600,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle(
        color: textSwatch.shade700,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        color: textSwatch.shade700,
        fontSize: 15,
      ),
      subtitle2: TextStyle(
        color: textSwatch.shade600,
        fontSize: 10,
      ),
      bodyText1: TextStyle(
        color: textSwatch.shade700,
        fontSize: 11,
      ),
      bodyText2: TextStyle(
        color: textSwatch.shade500,
        fontSize: 14,
      ),
      button: TextStyle(
        color: textSwatch.shade500,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        color: textSwatch.shade500,
        fontSize: 13,
      ),
      overline: TextStyle(
        color: textSwatch.shade500,
        fontSize: 8,
      ),
    ),
  );

  /*Getter to get Palatte for light theme*/
  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF24242a),
    backgroundColor: const Color(0xFF24242a),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: Colors.green,
    dividerColor: const Color(0x1CFFFFFF),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: textSwatch.shade200,
        fontWeight: FontWeight.w300,
        fontSize: 35,
      ),
      headline2: TextStyle(
        color: textSwatch.shade300,
        fontSize: 30,
      ),
      headline3: TextStyle(
        color: textSwatch.shade200,
        fontSize: 25,
      ),
      headline4: TextStyle(
        color: textSwatch.shade200,
        fontSize: 20,
      ),
      headline5: TextStyle(
        color: textSwatch.shade300,
        fontSize: 18,
      ),
      headline6: TextStyle(
        color: textSwatch.shade200,
        fontSize: 16,
      ),
      subtitle1: TextStyle(
        color: textSwatch.shade200,
        fontSize: 15,
      ),
      subtitle2: TextStyle(
        color: textSwatch.shade300,
        fontSize: 10,
      ),
      bodyText1: TextStyle(
        color: textSwatch.shade300,
        fontSize: 11,
      ),
      bodyText2: TextStyle(
        color: textSwatch.shade200,
        fontSize: 12,
      ),
      button: TextStyle(
        color: textSwatch.shade400,
        fontSize: 16,
      ),
      caption: TextStyle(
        color: textSwatch.shade400,
        fontSize: 13,
      ),
      overline: TextStyle(
        color: textSwatch.shade400,
        fontSize: 8,
      ),
    ),
  );
}
