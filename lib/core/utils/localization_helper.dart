import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // for debugPrint

class LocalizationHelper {
  final String locale;
  Map<String, dynamic>? _localizedStrings;

  LocalizationHelper(this.locale);

  Future<void> load() async {
    final String path = 'lib/l10n/$locale.json';
    debugPrint("📂 Trying to load file: $path");

    try {
      final String jsonString = await rootBundle.loadString(path);
      _localizedStrings = json.decode(jsonString);

      debugPrint("✅ Successfully loaded file: $path");
      debugPrint("📑 Keys loaded: ${_localizedStrings?.keys.toList()}");
    } catch (e) {
      debugPrint("❌ Failed to load file: $path");
      debugPrint("Error: $e");
    }
  }

  String tr(String key, {Map<String, String>? params}) {
    // ✅ Split key for nested JSON support (e.g. "login_screen.welcome")
    final parts = key.split('.');
    dynamic value = _localizedStrings;

    for (final part in parts) {
      if (value is Map<String, dynamic> && value.containsKey(part)) {
        value = value[part];
      } else {
        return key; // fallback agar key na mile
      }
    }

    String text = value?.toString() ?? key;

    // ✅ Replace params if provided
    if (params != null) {
      params.forEach((k, v) {
        text = text.replaceAll('{$k}', v);
      });
    }

    return text;
  }
}
