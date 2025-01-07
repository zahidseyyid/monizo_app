import 'package:flutter/material.dart';
import 'package:monizo_app/core/theme/colors.dart';
import 'package:monizo_app/presentation/widgets/home_page/header_curve_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const HeaderCurveContainer(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text("Body Content"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
