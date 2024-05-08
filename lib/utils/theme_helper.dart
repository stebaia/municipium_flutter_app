import 'package:flutter/material.dart';

class ThemeHelper {
  static const blueMunicipium = Color(0xff2140E9);
  static const lightGrey = Color.fromRGBO(188, 191, 200, 1);
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: blueMunicipium,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      color: blueMunicipium,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: blueMunicipium,
      brightness: Brightness.dark,
    ),
  );
}
