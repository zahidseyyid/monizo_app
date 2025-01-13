import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/components/gradient_button.dart';
import 'package:monizo_app/core/constants/app_assets.dart';
import 'package:monizo_app/core/constants/app_multi_language_strings.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Center(
          child: Column(
            children: [
              Image.asset(AppAssets.monizoOnboarding),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55.w),
                child: Text(
                  AppMultiLanguageStrings.onboardingTitle,
                  textAlign: TextAlign.center,
                  style: context.displaySmall36,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: GradientButton(
                  text: AppMultiLanguageStrings.onboardingButtonTitle,
                  onPressed: () {
                    if (context.locale == const Locale("tr")) {
                      context.setLocale(const Locale("en"));
                    } else {
                      context.setLocale(const Locale("tr"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
