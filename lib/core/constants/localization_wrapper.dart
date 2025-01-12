import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:monizo_app/core/constants/app_assets.dart';
import 'package:monizo_app/core/constants/app_constants.dart';
import 'app_providers.dart';

class LocalizationWrapper extends StatelessWidget {
  final Widget child;

  const LocalizationWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppConstants.supportedLocales,
      path: AppAssets.languagePath,
      fallbackLocale: AppConstants.supportedLocales.first,
      child: AppProviders(
        child: child,
      ),
    );
  }
}
