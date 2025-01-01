import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monizo_app/core/theme/colors.dart';

class AppTextStyles {
  static TextStyle get displayMedium50 => GoogleFonts.inter(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get megaTitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get body => const TextStyle(
        fontSize: 14,
      );
}

TextStyle? displayMedium({required BuildContext context, Color? color}) =>
    Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color ?? AppColors.white);
