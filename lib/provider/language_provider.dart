import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _locale = 'en';
  bool _isLoading = true;

  String get locale => _locale;
  bool get isLoading => _isLoading;

  LanguageProvider() {
    loadLocale();
  }

  Future<void> loadLocale() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    _locale = prefs.getString('selected_locale') ?? 'en';

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLocale(String locale) async {
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', locale);
  }
}
