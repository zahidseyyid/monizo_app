import 'package:flutter/material.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';

class IncomeExpensesCard extends StatelessWidget {
  final String title;
  final String amount;
  final String iconPath;

  const IncomeExpensesCard({
    super.key,
    required this.title,
    required this.amount,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(iconPath),
            SizedBox(width: 6),
            Text(
              title,
              style: context.titleSmall16,
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          amount,
          style: context.titleLarge20,
        ),
      ],
    );
  }
}
