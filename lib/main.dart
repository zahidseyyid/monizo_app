import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/constants/app_constants.dart';
import 'package:monizo_app/core/constants/app_providers.dart';
import 'package:monizo_app/core/theme/themes.dart';
import 'package:monizo_app/presentation/views/root_page.dart';
import 'package:toastification/toastification.dart';
import 'core/constants/app_initializer.dart';
import 'core/constants/localization_wrapper.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(
    const LocalizationWrapper(
      child: AppProviders(
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return ToastificationWrapper(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const RootPage(),
          ),
        );
      },
    );
  }
}
