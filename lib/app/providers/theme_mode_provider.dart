import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _currentThemeMode = .system;

  ThemeMode get themeMode => _currentThemeMode;

  void changeThemeMode(ThemeMode mode) {
    _currentThemeMode = mode;
    _saveThemeMode(mode);
    notifyListeners();
  }

  void _saveThemeMode(ThemeMode mode) async {
    SharedPreferences SharedPrefernces = await SharedPreferences.getInstance();
    await SharedPrefernces.setString('theme_mode', mode.name);
  }

  Future<void> setDefaultThemeMode() async {
    SharedPreferences SharedPrefernces = await SharedPreferences.getInstance();
    String? themeMode = SharedPrefernces.getString('theme_mode');
    if (themeMode != null) {
      _currentThemeMode = _parseThemeMode(themeMode);
      notifyListeners();
    }
  }

  ThemeMode _parseThemeMode(String themeMode) {
    switch (themeMode) {
      case 'light':
        return .light;
      case 'dark':
        return .dark;
      default:
        return .system;
    }
  }
}
