import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/core/theme/app_colors.dart';
import 'package:monizo_app/presentation/widgets/home_page/income_expenses_card.dart';

class CardWidget extends StatelessWidget {
  final double totalBalance;
  final double income;
  final double expense;
  const CardWidget({
    super.key,
    required this.totalBalance,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201.h,
      decoration: ShapeDecoration(
        color: AppColors.cardGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 25.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: context.titleSmall16,
            ),
            AutoSizeText(
              '₺ $totalBalance',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.headlineLarge32,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 15,
                  child: IncomeExpensesCard(
                    title: 'Income',
                    amount: '₺ $income',
                    iconPath: "assets/images/arrow-downward-icon.png",
                  ),
                ),
                Spacer(flex: 3),
                Expanded(
                  flex: 15,
                  child: IncomeExpensesCard(
                    title: 'Expense',
                    amount: '₺ $expense',
                    iconPath: "assets/images/arrow-upward-icon.png",
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
