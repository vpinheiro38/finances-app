import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionItem extends StatelessWidget {
  final String category;
  final double moneyAmount;
  final String agentInvolved;
  final DateTime date;

  TransactionItem(this.category, this.moneyAmount, this.agentInvolved, this.date);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            _buildTransactionTypeIcon(),
            _buildLeftColumn(context),
            _buildRightColumn(context),
            _buildChevronIcon()
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTypeIcon() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Icon(
        (moneyAmount.isNegative) ? Icons.remove : Icons.add,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildLeftColumn(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;

    return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(category, style: textStyles.smallBodyTextStyle)
              ),
              Text(agentInvolved, style: textStyles.bodyTextStyle)
            ],
          ),
        )
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(DateFormat.format(date), style: textStyles.smallBodyTextStyle),
        Text(NumberFormat.currency(defaultTexts.currency, moneyAmount), style: textStyles.bodyTextStyle)
      ],
    );
  }

  Widget _buildChevronIcon() {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Icon(Icons.chevron_right, color: Colors.grey));
  }
}
