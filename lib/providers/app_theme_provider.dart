import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
 
  ThemeMode appTheme = ThemeMode.light;

  changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }

    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
