import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:municipium/utils/theme_helper.dart';

class LightTheme {
  static const primaryColor = Color(0xff2140E9);
  static const lightBlue = Color(0xFFE3F2FD);
  static const baseColor = Colors.black;
  static const greyFine = Color.fromRGBO(245, 248, 253, 1);
  static const lightGrey = Color.fromRGBO(234, 238, 247, 1);

  static get make => ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        dividerColor: baseColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: lightBlue,
        ),
        appBarTheme: AppBarTheme(elevation: 0, surfaceTintColor: lightBlue),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, height: 17 / 14),
          errorStyle: TextStyle(
            fontSize: 10,
            height: 0.6,
          ),
          errorMaxLines: 10,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        cardColor: greyFine,
        cardTheme: const CardTheme(surfaceTintColor: greyFine),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        radioTheme: RadioThemeData(
          fillColor: ThemeExtensions.resolveMaterialStateProperty(primaryColor),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values)
              platform: const CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}

class DarkTheme {
  static const primaryColor = Color(0xff2140E9);
  static const darkBlack = Color.fromARGB(40, 41, 40, 40);
  static const baseColor = Colors.white;

  static get make => ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        dividerColor: baseColor,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: darkBlack,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(elevation: 0, surfaceTintColor: darkBlack),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, height: 17 / 14),
          errorStyle: TextStyle(
            fontSize: 10,
            height: 0.6,
          ),
          errorMaxLines: 10,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
            textStyle: const TextStyle(
              fontSize: 14.0,
            ),
            foregroundColor: Colors.white,
          ),
        ),
        cardColor: Color(0xFF303030),
        cardTheme: const CardTheme(surfaceTintColor: Color(0xFF303030)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: ThemeExtensions.resolveMaterialStateProperty(primaryColor),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values)
              platform: const CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}

enum ThemeType {
  system,
  light,
  dark,
}

extension ThemeExtensions on ThemeType {
  static resolveMaterialStateProperty(Color color) =>
      MaterialStateProperty.resolveWith((states) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };

        if (states.any(interactiveStates.contains)) {
          return color;
        }

        return null;
      });

  String? localize(BuildContext context) {
    switch (this) {
      case ThemeType.system:
        return AppLocalizations.of(context)?.theme_system;
      case ThemeType.light:
        return AppLocalizations.of(context)?.theme_light;
      case ThemeType.dark:
        return AppLocalizations.of(context)?.theme_dark;
    }
  }
}
