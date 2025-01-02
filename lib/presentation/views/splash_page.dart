import 'package:flutter/material.dart';
import 'package:monizo_app/core/constants/app_strings.dart';
import 'package:monizo_app/core/theme/colors.dart';
import 'package:monizo_app/core/theme/text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.appName, style: displayMedium(context: context))
            ],
          ),
        ),
      ),
    );
  }
}