import 'package:flutter/material.dart';
import 'package:wishlist/themes/themes.dart';
import 'package:wishlist/preferences.dart/custom_preferences.dart';

class TemaService with ChangeNotifier {
  ThemeData currentTheme;

  TemaService({required bool isDarkMode})
      : currentTheme =
            isDarkMode ? CustomDarkTheme.miTheme : CustomLightTheme.miTheme;

  void setLightMode() {
    CustomPreferences.isDark = false;
    currentTheme = CustomLightTheme.miTheme;
    notifyListeners();
  }

  void setDarkMode() {
    CustomPreferences.isDark = true;
    currentTheme = CustomDarkTheme.miTheme;
    notifyListeners();
  }
}
