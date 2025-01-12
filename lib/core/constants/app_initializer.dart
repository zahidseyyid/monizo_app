import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
