import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatelessWidget {
  final String _budgetName;
  final Function(String) _onNameChanged;
  final Function() _onTextFieldUnfocused;
  final Function() _onCardPressed;

  BudgetCard(this._budgetName, this._onNameChanged, this._onTextFieldUnfocused, this._onCardPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: GestureDetector(
        onTap: _onCardPressed,
        child: _buildCard(context)
      )
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
        color: AppColors.cardColor,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                _buildNameField(context),
                _buildChevronIcon()
              ],
            )
        )
    );
  }

  Widget _buildNameField(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Expanded(
      child: Focus(
        onFocusChange: (focused) {
          if (!focused)
            _onTextFieldUnfocused();
        },
        child: TextField(
          controller: TextEditingController(text: _budgetName),
          onChanged: _onNameChanged,
          style: textStyles.bodyTextStyle,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: defaultTexts.newBudget,
              hintStyle: textStyles.hintTextStyle
          ),
        ),
      ),
    );
  }

  Widget _buildChevronIcon() {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: Icon(
            Icons.chevron_right,
            color: AppColors.chevronColor),
      ),
    );
  }

}