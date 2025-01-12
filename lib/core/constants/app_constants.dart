import 'package:flutter/material.dart';
import 'package:monizo_app/core/constants/app_multi_language_strings.dart';

class AppConstants {
  static String get appTitle => "Monizo";
  static List<Locale> get supportedLocales => [
        Locale(AppMultiLanguageStrings.en),
        Locale(AppMultiLanguageStrings.tr),
      ];
}
