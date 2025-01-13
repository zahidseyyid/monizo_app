import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:monizo_app/core/constants/app_constants.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBloc(items: AppConstants.pages),
        ),
        BlocProvider(
          create: (_) => LocaleBloc(
            supportedLocales: AppConstants.supportedLocales,
          )..add(const LocaleEvent.loadLocale()),
        ),
      ],
      child: child,
    );
  }
}
