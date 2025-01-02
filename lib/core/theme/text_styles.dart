import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get displayMedium50 => GoogleFonts.inter(
        fontSize: 50.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get displaySmall36 => GoogleFonts.inter(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleMedium18 => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      );
}
