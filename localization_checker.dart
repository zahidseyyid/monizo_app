// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  const languagePath = "assets/langs";
  const mainJsonFile = "assets/langs/en.json";
  const appMultiLanguageStringsFile =
      "lib/core/constants/app_multi_language_strings.dart";

  // en.json anahtarlarını yükle
  final mainJson = File(mainJsonFile);
  if (!await mainJson.exists()) {
    print("Main JSON file (en.json) not found at $mainJsonFile");
    return;
  }

  final mainJsonContent = jsonDecode(await mainJson.readAsString());
  final mainKeys = mainJsonContent.keys.toSet();

  // Dil klasörünü tara
  final langDir = Directory(languagePath);
  if (!await langDir.exists()) {
    print("Language directory not found at $languagePath");
    return;
  }

  final langFiles = langDir.listSync().whereType<File>().where(
      (file) => file.path.endsWith('.json') && file.path != mainJsonFile);

  for (final file in langFiles) {
    final content = jsonDecode(await file.readAsString());
    final fileKeys = content.keys.toSet();

    // en.json içinde olmayan anahtarları kaldır (main dosya en.json dosyası)
    final keysToRemove = fileKeys.difference(mainKeys);
    if (keysToRemove.isNotEmpty) {
      for (final key in keysToRemove) {
        content.remove(key);
      }
      print("Removed keys from ${file.path}: ${keysToRemove.join(', ')}");
    }

    // en.json içinde olup bu dil dosyasında olmayan anahtarları ekle
    final keysToAdd = mainKeys.difference(fileKeys);
    if (keysToAdd.isNotEmpty) {
      for (final key in keysToAdd) {
        content[key] = mainJsonContent[key]; // Varsayılan değeri en.json'dan al
      }
      print("Added keys to ${file.path}: ${keysToAdd.join(', ')}");
    }

    // Güncellenmiş dosyayı yaz
    const encoder = JsonEncoder.withIndent('  '); // Formatlı JSON yazımı
    final formattedJson = encoder.convert(content);

    await file.writeAsString(formattedJson);
    print("Updated ${file.path}.");
  }

  print("All language files synchronized with en.json.");

  // appMultiLanguageStrings sınıfını oluştur
  final appMultiLanguageStrings = StringBuffer();
  appMultiLanguageStrings
      .writeln("import 'package:easy_localization/easy_localization.dart';");
  appMultiLanguageStrings.writeln();
  appMultiLanguageStrings.writeln("class AppMultiLanguageStrings {");

  for (final key in mainKeys) {
    final camelCaseKey = _toCamelCase(key);
    appMultiLanguageStrings.writeln(
        "  static String get $camelCaseKey => \"$key\".tr();"); // Getter metot olarak ekle
  }

  appMultiLanguageStrings.writeln("}");

  final appMultiLanguageStringsFileHandle = File(appMultiLanguageStringsFile);
  await appMultiLanguageStringsFileHandle
      .writeAsString(appMultiLanguageStrings.toString());
  print(
      "AppMultiLanguageStrings.dart updated at $appMultiLanguageStringsFile.");
}

String _toCamelCase(String input) {
  return input.replaceAllMapped(RegExp(r'_(.)'), (match) {
    return match.group(1)!.toUpperCase();
  });
}
