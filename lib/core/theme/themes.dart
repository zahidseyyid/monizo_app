import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/colors.dart';
import 'package:monizo_app/core/theme/text_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      displayMedium: AppTextStyles.displayMedium50,
    ),
  );
}
