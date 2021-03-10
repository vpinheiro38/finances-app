import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionCreationHeader extends StatelessWidget {
  final VoidCallback _onPopButtonPressed;
  final IconData iconData;

  TransactionCreationHeader(this._onPopButtonPressed, {this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPopButton(),
        _buildTitle(context)
      ],
    );
  }

  Widget _buildPopButton() {
    return IconButton(
        icon: Icon((iconData == null) ? Icons.arrow_back : iconData, color: AppColors.textColor),
        onPressed: _onPopButtonPressed,
        padding: const EdgeInsets.fromLTRB(6, 0, 0, 0)
    );
  }

  Widget _buildTitle(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Text(
        defaultTexts.createTransaction,
        style: textStyles.h1TextStyle
    );
  }

}