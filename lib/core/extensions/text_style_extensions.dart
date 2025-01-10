import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

extension TextStyleExtensions on BuildContext {
  TextStyle get displayMedium50 => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall36 =>
      Theme.of(this).textTheme.displaySmall!.copyWith(color: AppColors.primary);

  TextStyle get headlineLarge32 => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get titleLarge20 =>
      Theme.of(this).textTheme.titleLarge!.copyWith(color: AppColors.white);

  TextStyle get titleMedium18 =>
      Theme.of(this).textTheme.titleMedium!.copyWith(color: AppColors.white);

  TextStyle get titleSmall16 =>
      Theme.of(this).textTheme.titleSmall!.copyWith(color: AppColors.white);

  TextStyle get labelLarge14 => Theme.of(this).textTheme.labelLarge!;
}
