import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale  _currentLocale = Locale('en');

  final List<Locale> _locales = [Locale('en'), Locale('bn')];

  List<Locale> get supportedLocales =>_locales;

  Locale get currentLocale => _currentLocale;

  void changeThemeMode(Locale locale) {
    _currentLocale = locale;
    _saveLocale(locale);
    notifyListeners();
  }

  void _saveLocale(Locale locale) async {
    SharedPreferences SharedPrefernces = await SharedPreferences.getInstance();
    await SharedPrefernces.setString('locale', locale.languageCode);
  }

  Future<void> setDefaultLocale() async {
    SharedPreferences SharedPrefernces = await SharedPreferences.getInstance();
    String? locale = SharedPrefernces.getString('locale');
    if (locale != null) {
     _currentLocale = Locale(locale);
    }
  }
}

