import 'package:flutter/material.dart';

class AppColors {
  static const primaryGradient = LinearGradient(
    colors: [
      primary,
      secondary,
    ],
    begin: Alignment.topLeft, // Sol üstten başlar
    end: Alignment.bottomRight, // Sağ alta biter
    stops: [1.0, 0.0], // Renk geçişi düzenlenir
  );

  static const buttonGradient = LinearGradient(colors: [
    Color(0xFF69AEA9),
    Color(0xFF3F8782),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF444444);
  static const primary = Color(0xFF438883);
  static const secondary = Color(0xFF63B5AF);
  static const darkGreen = Color(0xFF1B5C58);
  static const lightGreen = Color(0xFF3E7C78);
  static const textGrey = Color(0xFFD0E5E4);
  static const titleGreen = Color(0xFF25A969);
}
