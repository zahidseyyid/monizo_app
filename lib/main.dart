import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:monizo_app/core/constants/app_strings.dart';
import 'package:monizo_app/core/theme/themes.dart';

import 'presentation/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale(AppStrings.tr), Locale(AppStrings.en)],
      path: AppStrings.languagePath,
      fallbackLocale: Locale(AppStrings.en),
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashPage(),
    );
  }
}
