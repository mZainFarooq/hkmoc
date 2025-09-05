import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/localization_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _locale = 'en';
  LocalizationHelper? _helper;
  bool _isLoading = true;

  String get locale => _locale;
  LocalizationHelper? get helper => _helper;
  bool get isLoading => _isLoading;

  LanguageProvider() {
    debugPrint("📢 LanguageProvider constructor called");
    loadLocale();
  }

  Future<void> loadLocale() async {
    debugPrint("🔄 loadLocale() started...");
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLocale = prefs.getString('selected_locale') ?? 'en';
      debugPrint("✅ Saved locale from prefs: $savedLocale");

      _locale = savedLocale;

      _helper = LocalizationHelper(_locale);
      debugPrint("📥 Trying to load JSON for locale: $_locale");

      await _helper!.load();
      debugPrint("✅ JSON loaded successfully for locale: $_locale");
    } catch (e) {
      debugPrint("❌ Error in loadLocale: $e");
      _helper = null; // fallback
    }

    _isLoading = false;
    notifyListeners();
    debugPrint("✅ loadLocale() finished");
  }

  Future<void> setLocale(String locale) async {
    debugPrint("🔄 setLocale($locale) started...");
    _isLoading = true;
    notifyListeners();

    try {
      _locale = locale;
      _helper = LocalizationHelper(locale);

      debugPrint("📥 Trying to load JSON for new locale: $_locale");
      await _helper!.load();
      debugPrint("✅ JSON loaded successfully for locale: $_locale");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_locale', locale);
      debugPrint("💾 Saved locale into prefs: $locale");
    } catch (e) {
      debugPrint("❌ Error in setLocale: $e");
      _helper = null; // fallback
    }

    _isLoading = false;
    notifyListeners();
    debugPrint("✅ setLocale() finished");
  }
}
