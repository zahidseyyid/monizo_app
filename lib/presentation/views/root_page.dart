import 'package:appvory_dev_kit/appvory_dev_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monizo_app/core/data/bottom_navigation_data.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BasicBottomNavigation(),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return pagesRoute[state.selectedIndex];
        },
      ),
    );
  }
}
