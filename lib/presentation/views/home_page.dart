import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/presentation/widgets/home_page/card_widget.dart';
import 'package:monizo_app/presentation/widgets/home_page/transactions_list_tile_widget.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/home_page/header_curve_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Home Page', style: TextStyle(color: AppColors.white)),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderCurveContainer(),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                children: [
                  CardWidget(
                    totalBalance: 1000000,
                    income: 500000,
                    expense: 30000,
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions history',
                        style: context.titleMedium18.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to transactions page
                        },
                        child: Text(
                          'See all',
                          style: context.labelLarge14.copyWith(
                            color: AppColors.textButtonGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return TransactionsListTileWidget(
                          index: index,
                          transactionTitle: 'Transaction $index',
                          transactionDate: '01.01.2021 12:00',
                          transactionAmount: 1000 * index.toDouble() + 1000,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
