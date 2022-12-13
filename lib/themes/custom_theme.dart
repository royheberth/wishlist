import 'package:flutter/material.dart';

final temaLight = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF2A4742),
  scaffoldBackgroundColor: const Color(0xFF33544F),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF33544F),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2A4742),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  ),
);

final temaDark = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF2f7BA8),
  scaffoldBackgroundColor: const Color(0xFF35383A),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF35383A),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2f7BA8),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  ),
);
