import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:flutter/material.dart';
import 'package:monizo_app/presentation/widgets/home_page/add_expense_dialog.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ModernBottomNavigation(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomDialog(),
          );
        },
      ),
    );
  }
}
