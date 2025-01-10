import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/app_colors.dart';
import 'package:monizo_app/core/theme/text_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      displayMedium: AppTextStyles.displayMedium50,
      displaySmall: AppTextStyles.displaySmall36,
      headlineLarge: AppTextStyles.headlineLarge32,
      titleLarge: AppTextStyles.titleLarge20,
      titleMedium: AppTextStyles.titleMedium18,
      titleSmall: AppTextStyles.titleSmall16,
      labelLarge: AppTextStyles.labelLarge14,
    ),
  );
}
