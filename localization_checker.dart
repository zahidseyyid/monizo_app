import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

void main() async {
  const languagePath = "assets/langs";
  const mainJsonFile = "assets/langs/en.json";
  const appStringsFile = "lib/core/constants/app_strings.dart";

  // en.json anahtarlarını yükle
  final mainJson = File(mainJsonFile);
  if (!await mainJson.exists()) {
    if (kDebugMode) {
      print("Main JSON file (en.json) not found at $mainJsonFile");
    }
    return;
  }

  final mainJsonContent = jsonDecode(await mainJson.readAsString());
  final mainKeys = mainJsonContent.keys.toSet();

  // Dil klasörünü tara
  final langDir = Directory(languagePath);
  if (!await langDir.exists()) {
    if (kDebugMode) {
      print("Language directory not found at $languagePath");
    }
    return;
  }

  final langFiles = langDir.listSync().whereType<File>().where(
      (file) => file.path.endsWith('.json') && file.path != mainJsonFile);

  for (final file in langFiles) {
    final content = jsonDecode(await file.readAsString());
    final fileKeys = content.keys.toSet();

    // en.json içinde olmayan anahtarları kaldır
    final keysToRemove = fileKeys.difference(mainKeys);
    if (keysToRemove.isNotEmpty) {
      for (final key in keysToRemove) {
        content.remove(key);
      }
      if (kDebugMode) {
        print("Removed keys from ${file.path}: ${keysToRemove.join(', ')}");
      }
    }

    // en.json içinde olup bu dil dosyasında olmayan anahtarları ekle
    final keysToAdd = mainKeys.difference(fileKeys);
    if (keysToAdd.isNotEmpty) {
      for (final key in keysToAdd) {
        content[key] = mainJsonContent[key]; // Varsayılan değeri en.json'dan al
      }
      if (kDebugMode) {
        print("Added keys to ${file.path}: ${keysToAdd.join(', ')}");
      }
    }

    // Güncellenmiş dosyayı yaz
    const encoder = JsonEncoder.withIndent('  '); // Formatlı JSON yazımı
    final formattedJson = encoder.convert(content);

    await file.writeAsString(formattedJson);
    if (kDebugMode) {
      print("Updated ${file.path}.");
    }
  }

  if (kDebugMode) {
    print("All language files synchronized with en.json.");
  }

  // AppStrings sınıfını oluştur
  final appStrings = StringBuffer();
  appStrings
      .writeln("import 'package:easy_localization/easy_localization.dart';");
  appStrings.writeln();
  appStrings.writeln("class AppStrings {");

  for (final key in mainKeys) {
    final camelCaseKey = _toCamelCase(key);
    appStrings.writeln(
        "  static String get $camelCaseKey => \"$key\".tr();"); // Getter metot olarak ekle
  }

  appStrings.writeln("}");

  final appStringsFileHandle = File(appStringsFile);
  await appStringsFileHandle.writeAsString(appStrings.toString());
  if (kDebugMode) {
    print("AppStrings.dart updated at $appStringsFile.");
  }
}

String _toCamelCase(String input) {
  return input.replaceAllMapped(RegExp(r'_(.)'), (match) {
    return match.group(1)!.toUpperCase();
  });
}
