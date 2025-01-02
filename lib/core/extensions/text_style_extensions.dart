import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/colors.dart';

extension TextStyleExtensions on BuildContext {
  TextStyle get displayMedium =>
      Theme.of(this).textTheme.displayMedium!.copyWith(color: AppColors.white);

  TextStyle get displaySmall =>
      Theme.of(this).textTheme.displaySmall!.copyWith(color: AppColors.primary);

  TextStyle titleMedium({Color? color}) => Theme.of(this)
      .textTheme
      .titleMedium!
      .copyWith(color: color ?? AppColors.white);
}
