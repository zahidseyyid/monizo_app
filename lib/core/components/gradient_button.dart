import 'package:flutter/material.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/core/theme/colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(30), // Kenar yuvarlama
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Gölge rengi
              offset: const Offset(0, 5), // Gölge pozisyonu
              blurRadius: 10, // Gölge bulanıklık
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: context.titleMedium(),
          ),
        ),
      ),
    );
  }
}
