import 'package:wishlist/preferences/custom_preferences.dart';
import 'package:wishlist/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider()
      : currentTheme = CustomPreferences.isDark
            ? CustomTheme.darkTheme
            : CustomTheme.lightTheme;

  void setTheme(bool isDark) {
    CustomPreferences.isDark = isDark;
    currentTheme = isDark ? CustomTheme.darkTheme : CustomTheme.lightTheme;
    notifyListeners();
  }
}
