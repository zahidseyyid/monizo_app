import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monizo_app/core/extensions/text_style_extensions.dart';
import 'package:monizo_app/core/theme/app_colors.dart';

class TransactionsListTileWidget extends StatelessWidget {
  final String transactionTitle;
  final String transactionDate;
  final double transactionAmount;
  final int index;
  const TransactionsListTileWidget({
    super.key,
    required this.index,
    required this.transactionTitle,
    required this.transactionDate,
    required this.transactionAmount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.cardGreen,
        radius: 25,
        child: Icon(
          Icons.account_balance_wallet,
          color: AppColors.white,
        ),
      ),
      title: AutoSizeText(
        transactionTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.titleSmall16.copyWith(
          color: AppColors.black,
        ),
      ),
      subtitle: Text(
        transactionDate,
        style: context.labelLarge14.copyWith(
          color: AppColors.textButtonGrey,
        ),
      ),
      trailing: AutoSizeText(
        '${index % 2 == 0 ? '+ ' : '- '}₺ $transactionAmount',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.titleMedium18.copyWith(
          color: index % 2 == 0
              ? AppColors.textIncomeGreen
              : AppColors.textExpensesRed,
        ),
      ),
    );
  }
}
