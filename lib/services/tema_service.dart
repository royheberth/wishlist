import 'package:flutter/material.dart';
import 'package:wishlist/themes/custom_theme.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class TemaService with ChangeNotifier {
  ThemeData currentTheme;

  TemaService({required bool isDarkMode})
      : currentTheme = isDarkMode ? temaDark : temaLight;

  void setLightMode() {
    CustomPreferences.isDark = false;
    currentTheme = temaLight;
    notifyListeners();
  }

  void setDarkMode() {
    CustomPreferences.isDark = true;
    currentTheme = temaDark;
    notifyListeners();
  }
}
