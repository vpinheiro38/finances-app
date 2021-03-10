import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/model/models/transaction.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_content.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_second_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum TransactionType { inflow, outflow }

class TransactionCreationFirstStep extends StatefulWidget {
  final VoidCallback _onCloseTransactionCreation;
  final int _budgetId;

  TransactionCreationFirstStep(this._budgetId, this._onCloseTransactionCreation);

  @override
  State<StatefulWidget> createState() => _TransactionCreationFirstStepState(_budgetId, _onCloseTransactionCreation);
}

class _TransactionCreationFirstStepState extends State<TransactionCreationFirstStep> {
  final VoidCallback _onCloseTransactionCreation;
  final int _budgetId;

  TextStyles _textStyles;
  DefaultTexts _defaultTexts;
  TransactionType _transactionType;
  TextEditingController _textEditingController;

  Transaction _transactionBeingCreated;

  _TransactionCreationFirstStepState(this._budgetId, this._onCloseTransactionCreation);

  @override
  void initState() {
    super.initState();

    _transactionBeingCreated = Transaction(_budgetId, DateTime.now().millisecondsSinceEpoch, "Outros", -1, "");
    _transactionType = TransactionType.outflow;
    _textEditingController = TextEditingController(text: _formatCurrency(0));
    _textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    _defaultTexts = Provider.of<DefaultTexts>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return TransactionCreationContent(
      children: [
        _buildTransactionTypeQuestion(),
        _buildTransactionTypeSelection(),
        _buildTransactionMoneyQuestion(),
        _buildTransactionMoneyInput(),
        _buildButtonNext(context)
      ],
      onPopButtonPressed: _onCloseTransactionCreation,
      returnIcon: Icons.close,
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
            _transactionBeingCreated.moneyAmount = (value == TransactionType.inflow) ? 1 : -1;
          });
        },
      ),
    );
  }

  Widget _buildTransactionMoneyQuestion() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Text(
        defaultTexts.askTransactionMoney,
        style: textStyles.h2TextStyle,
      ),
    );
  }

  Widget _buildTransactionMoneyInput() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Row(
      children: [
        Text("${defaultTexts.currency} ", style: textStyles.largeBodyTextStyle),
        Flexible(
          child: TextField(
            controller: _textEditingController,
            onChanged: _onMoneyInputChanged,
            keyboardType: TextInputType.number,
            style: textStyles.largeBodyTextStyle,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: defaultTexts.newBudget,
                hintStyle: textStyles.grayTextStyle
            ),
            inputFormatters: [
              TextInputFormatter.withFunction(_formatMoneyInput)
            ],

          ),
        )
      ],
    );
  }

  void _onMoneyInputChanged(String text) {
    String moneyAmountText = text.replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll('_', '')
        .replaceAll('-', '');

    double moneyAmount = double.parse(moneyAmountText)/100;

    setState(() {
      _transactionBeingCreated.moneyAmount = moneyAmount;
    });
  }

  TextEditingValue _formatMoneyInput(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text
        .replaceAll('.', '')
        .replaceAll(',', '')
        .replaceAll('_', '')
        .replaceAll('-', '');

    String newTextCopy = newText;
    int cursorPosition = newText.length;

    if (newText.isNotEmpty) {
      newTextCopy = _formatCurrency(double.parse(newText));
      cursorPosition = newTextCopy.length;
    }

    return TextEditingValue(
        text: newTextCopy,
        selection: TextSelection.collapsed(offset: cursorPosition)
    );
  }

  String _formatCurrency(num value) {
    ArgumentError.checkNotNull(value, 'value');

    value = value / 100;

    return NumberFormat.currency(
        customPattern: '###,###.##',
        locale: 'pt-BR'
    ).format(value);
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
                onPressed: () => _onNextButtonPressed(context),
                child: Text(_defaultTexts.next),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onNextButtonPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionCreationSecondStep(_transactionBeingCreated)));
  }

}