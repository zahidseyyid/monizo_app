import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle get displayMedium50 => GoogleFonts.inter(
        fontSize: 50.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );

  static TextStyle get displaySmall36 => GoogleFonts.inter(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get headlineLarge32 => GoogleFonts.inter(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  static TextStyle get titleLarge20 => GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle get titleMedium18 => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleSmall16 => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLarge14 => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      );
}
