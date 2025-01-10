import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/constants/app_strings.dart';
import 'package:monizo_app/core/constants/app_assets.dart';
import 'package:monizo_app/core/theme/themes.dart';
import 'package:monizo_app/presentation/views/root_page.dart';
import 'package:toastification/toastification.dart';

import 'core/data/bottom_navigation_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale(AppStrings.tr), Locale(AppStrings.en)],
      path: AppAssets.languagePath,
      fallbackLocale: Locale(AppStrings.en),
      child: BlocProvider(
        create: (context) => NavigationBloc(
          items: pages,
        ),
        child: const MainApp(),
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
            title: AppStrings.appName,
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
