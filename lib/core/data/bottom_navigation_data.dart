import 'package:flutter/material.dart';
import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:monizo_app/presentation/views/home_page.dart';
import 'package:monizo_app/presentation/views/onboarding_page.dart';
import 'package:monizo_app/presentation/views/splash_page.dart';

final pages = [
  NavigationItem(
    title: 'Home',
    icon: Icons.home,
  ),
  NavigationItem(
    title: 'Statistics',
    icon: Icons.insert_chart,
  ),
  NavigationItem(
    title: 'Wallet',
    icon: Icons.account_balance_wallet,
  ),
  NavigationItem(
    title: "Profile",
    icon: Icons.person,
  ),
];

final pagesRoute = [
  HomePage(),
  OnboardingPage(),
  SplashPage(),
  SplashPage(),
];
