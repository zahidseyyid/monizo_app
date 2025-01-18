import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

void main() async {
  const Map<String, dynamic> config = {
    "languagePath": "assets/langs", // JSON dil dosyalarının bulunduğu dizin
    "mainJsonFile": "assets/langs/en.json", // Ana dil dosyası
    "multiLanguageStringsFile":
        "lib/core/constants/app_multi_language_strings.dart", // Çeviri sınıfının yazılacağı dosya
    "processJsonFiles":
        true, // JSON dosyalarını işleyip işlemeyeceğini kontrol eder
    "processClassFile":
        true, // Çeviri sınıfını oluşturup oluşturmayacağını kontrol eder
  };

  final String languagePath = config["languagePath"];
  final String mainJsonFile = config["mainJsonFile"];
  final String appMultiLanguageStringsFile = config["multiLanguageStringsFile"];
  final bool processJsonFiles = config["processJsonFiles"];
  final bool processClassFile = config["processClassFile"];

  try {
    // en.json anahtarlarını yükle
    final mainJson = File(mainJsonFile);
    if (!await mainJson.exists()) {
      logDebug("Main JSON file (en.json) not found at $mainJsonFile");
      return;
    }

    final mainJsonContent = jsonDecode(await mainJson.readAsString());
    final mainKeys = mainJsonContent.keys.toSet();

    // JSON dosyalarında işlem yap
    if (processJsonFiles) {
      await _processJsonFiles(
          languagePath, mainJsonFile, mainKeys, mainJsonContent);
    }

    // Sınıf dosyasında işlem yap
    if (processClassFile) {
      await _generateMultiLanguageStringsClass(
          appMultiLanguageStringsFile, mainKeys);
    }
  } catch (e) {
    logDebug("An unexpected error occurred: $e");
  }
}

Future<void> _processJsonFiles(
  String languagePath,
  String mainJsonFile,
  Set<String> mainKeys,
  Map<String, dynamic> mainJsonContent,
) async {
  final langDir = Directory(languagePath);
  if (!await langDir.exists()) {
    logDebug("Language directory not found at $languagePath");
    return;
  }

  await for (final entity in langDir.list()) {
    if (entity is File &&
        entity.path.endsWith('.json') &&
        entity.path != mainJsonFile) {
      await _processLanguageFile(entity, mainKeys, mainJsonContent);
    }
  }

  logDebug("All language files synchronized with en.json.");
}

Future<void> _processLanguageFile(
  File file,
  Set<String> mainKeys,
  Map<String, dynamic> mainJsonContent,
) async {
  try {
    final rawContent = await file.readAsString();
    final content = rawContent.trim().isEmpty
        ? <String, dynamic>{}
        : jsonDecode(rawContent) as Map<String, dynamic>;

    final fileKeys = content.keys.toSet();

    // en.json içinde olmayan anahtarları kaldır
    final keysToRemove = fileKeys.difference(mainKeys);
    for (final key in keysToRemove) {
      content.remove(key);
    }
    if (keysToRemove.isNotEmpty) {
      logDebug("Removed keys from ${file.path}: ${keysToRemove.join(', ')}");
    }

    // en.json içinde olup bu dil dosyasında olmayan anahtarları ekle
    final keysToAdd = mainKeys.difference(fileKeys);
    for (final key in keysToAdd) {
      content[key] = mainJsonContent[key];
    }
    if (keysToAdd.isNotEmpty) {
      logDebug("Added keys to ${file.path}: ${keysToAdd.join(', ')}");
    }

    // Daha okunabilir formatta güncellenmiş dosyayı yaz
    const encoder =
        JsonEncoder.withIndent('  '); // Daha okunabilir JSON formatı
    final formattedJson = encoder.convert(content);
    await file.writeAsString(formattedJson);
    logDebug("Updated ${file.path}.");
  } catch (e) {
    logDebug("Failed to process ${file.path}: $e");
  }
}

Future<void> _generateMultiLanguageStringsClass(
  String filePath,
  Set<String> keys,
) async {
  try {
    final appMultiLanguageStrings = StringBuffer();
    appMultiLanguageStrings
        .writeln("import 'package:easy_localization/easy_localization.dart';");
    appMultiLanguageStrings.writeln();
    appMultiLanguageStrings.writeln("class AppMultiLanguageStrings {");

    for (final key in keys) {
      final camelCaseKey = _toCamelCase(key);
      appMultiLanguageStrings
          .writeln("  static String get $camelCaseKey => \"$key\".tr();");
    }

    appMultiLanguageStrings.writeln("}");

    final file = File(filePath);
    await file.writeAsString(appMultiLanguageStrings.toString());
    logDebug("AppMultiLanguageStrings.dart updated at $filePath.");
  } catch (e) {
    logDebug("Failed to generate AppMultiLanguageStrings: $e");
  }
}

String _toCamelCase(String input) {
  return input.replaceAllMapped(RegExp(r'_(.)'), (match) {
    return match.group(1)!.toUpperCase();
  });
}

void logDebug(String message) {
  if (kDebugMode) {
    print(message);
  }
}
