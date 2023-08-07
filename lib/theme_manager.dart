import 'package:flutter/material.dart';

import 'preferences.dart';

class ThemeManager extends ChangeNotifier {
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  static ThemeData get currentThemeData =>
      Preferences.darkMode ? ThemeData.dark() : ThemeData.light();

  bool get darkMode => Preferences.darkMode;
  set darkMode(bool value) {
    Preferences.darkMode = value;
    notifyListeners();
  }

  static final ThemeManager _instance = ThemeManager._internal();
}
