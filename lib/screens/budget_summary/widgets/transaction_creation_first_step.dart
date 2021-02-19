import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_second_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TransactionType { inflow, outflow }

class TransactionCreationFirstStep extends StatefulWidget {
  final VoidCallback _onCloseTransactionCreation;

  TransactionCreationFirstStep(this._onCloseTransactionCreation);

  @override
  State<StatefulWidget> createState() => _TransactionCreationFirstStepState(_onCloseTransactionCreation);
}

class _TransactionCreationFirstStepState extends State<TransactionCreationFirstStep> {
  final VoidCallback _onCloseTransactionCreation;

  TextStyles _textStyles;
  DefaultTexts _defaultTexts;

  TransactionType _transactionType = TransactionType.outflow;

  _TransactionCreationFirstStepState(this._onCloseTransactionCreation);

  @override
  Widget build(BuildContext context) {
    _textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    _defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTransactionTypeQuestion(),
                  _buildTransactionTypeSelection(),
                  _buildButtonNext(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.close, color: AppColors.textColor),
            onPressed: _onCloseTransactionCreation,
            padding: const EdgeInsets.fromLTRB(6, 0, 0, 0)
        ),
        _buildCreationTitle()
      ],
    );
  }

  Widget _buildCreationTitle() {
    return Text(
        _defaultTexts.createTransaction,
        style: _textStyles.h1TextStyle
    );
  }

  Widget _buildTransactionTypeQuestion() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
      child: Text(
        _defaultTexts.askTransactionType,
        style: _textStyles.h2TextStyle,
      ),
    );
  }

  Widget _buildTransactionTypeSelection() {
    return Row(
      children: [
        Expanded(
            child: _buildSelectionRadio(TransactionType.inflow, Text(_defaultTexts.inflow, style: _textStyles.bodyTextStyle))
        ),
        Expanded(
            child: _buildSelectionRadio(TransactionType.outflow, Text(_defaultTexts.outflow, style: _textStyles.bodyTextStyle))
        ),
      ],
    );
  }

  Widget _buildSelectionRadio(TransactionType transactionType, Text title) {
    return ListTile(
      title: title,
      contentPadding: const EdgeInsets.all(0),
      leading: Radio(
        activeColor: AppColors.textColor,
        hoverColor: AppColors.textColor,
        value: transactionType,
        groupValue: _transactionType,
        onChanged: (TransactionType value) {
          setState(() {
            _transactionType = value;
          });
        },
      ),
    );
  }

  Widget _buildButtonNext(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () => onNextButtonPressed(context),
                child: Text(_defaultTexts.next),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onNextButtonPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionCreationSecondStep()));
  }

}