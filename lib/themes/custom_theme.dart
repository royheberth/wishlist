import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xB38A8585),
    scaffoldBackgroundColor: const Color(0xFF47667b),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF243757),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white30,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        letterSpacing: 1.3,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black87,
            offset: Offset(1, 1),
            blurRadius: 1,
          ),
        ],
      ),
      headline3: TextStyle(
        fontSize: 16,
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 14,
        letterSpacing: 1.1,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black87,
            offset: Offset(1, 1),
            blurRadius: 3,
          ),
        ],
      ),
      headline5: TextStyle(
        fontSize: 13,
        letterSpacing: 1.1,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF92a68a),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF09c184),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xB38A8585),
    scaffoldBackgroundColor: const Color(0xFF1c2130),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        letterSpacing: 1.3,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.white54,
            offset: Offset(1, 1),
            blurRadius: 1,
          ),
        ],
      ),
      headline3: TextStyle(
        fontSize: 16,
        color: Colors.white30,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 14,
        letterSpacing: 1.1,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black87,
            offset: Offset(1, 1),
            blurRadius: 3,
          ),
        ],
      ),
      headline5: TextStyle(
        fontSize: 13,
        letterSpacing: 1.1,
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF506266),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF0de5a8),
    ),
  );
}
