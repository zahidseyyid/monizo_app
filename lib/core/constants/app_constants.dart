import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:flutter/material.dart';
import '../../models/expense_dropdown_item_model.dart';
import '../../presentation/views/home_page.dart';
import '../data/bottom_navigation_data.dart';
import 'app_multi_language_strings.dart';

class AppConstants {
  // Constants Text
  static String get appTitle => "Monizo";

  // Constants List
  static List<Locale> get supportedLocales => [
        Locale(AppMultiLanguageStrings.en),
        Locale(AppMultiLanguageStrings.tr),
      ];
  static List<NavigationItem> get pages => [
        NavigationItem(
          icon: Icons.home,
          widget: HomePage(),
        ),
        NavigationItem(
          icon: Icons.insert_chart,
          widget: StatisticsPage(),
        ),
        NavigationItem(
          icon: Icons.account_balance_wallet,
          widget: WidgetPage(),
        ),
        NavigationItem(
          icon: Icons.person,
          widget: ProfilePage(),
        ),
      ];
  static List<ExpenseDropdownItem> get expenseDropdownItems => [
        ExpenseDropdownItem(
          name: "Food",
          iconPath: "assets/images/notification-icon.png",
        ),
        ExpenseDropdownItem(
          name: "Transport",
          iconPath: "assets/images/notification-icon.png",
        ),
        ExpenseDropdownItem(
          name: "Shopping",
          iconPath: "assets/images/notification-icon.png",
        ),
        ExpenseDropdownItem(
          name: "Health",
          iconPath: "assets/images/notification-icon.png",
        ),
      ];
}
