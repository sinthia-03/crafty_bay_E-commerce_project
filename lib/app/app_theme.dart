import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;

  static ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: .w600),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: .w400),
    ),
  );

  static ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
  );
}
