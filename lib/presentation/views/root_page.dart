import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ModernBottomNavigation(
        onPressed: () {
          // ignore: avoid_print
        },
      ),
    );
  }
}
