import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionCreationSecondStep extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController(text: _formatCurrency(0));
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      height: MediaQuery.of(context).size.height/2,
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
                  _buildTransactionMoneyQuestion(context),
                  _buildTransactionMoneyInput(context),
                  _buildTransactionDateQuestion(context),
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
            icon: Icon(Icons.arrow_back, color: AppColors.textColor,),
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.fromLTRB(6, 0, 0, 0)
        ),
        _buildCreationTitle(context)
      ],
    );
  }

  Widget _buildCreationTitle(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Text(
        defaultTexts.createTransaction,
        style: textStyles.h1TextStyle
    );
  }

  Widget _buildTransactionMoneyQuestion(BuildContext context) {
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

  Widget _buildTransactionMoneyInput(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Row(
      children: [
        Text("${defaultTexts.currency} ", style: textStyles.largeBodyTextStyle),
        Flexible(
          child: TextField(
            controller: _textEditingController,
            onChanged: (text) {
              //_textEditingControll23. er.text = NumberFormat.currencyNumber(double.parse(text.replaceAll(",", ".")) * 10);
            },
            keyboardType: TextInputType.number,
            style: textStyles.largeBodyTextStyle,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: defaultTexts.newBudget,
                hintStyle: textStyles.hintTextStyle
            ),
            inputFormatters: [
              TextInputFormatter.withFunction(_formatMoneyInput)
            ],

          ),
        )
      ],
    );
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

  static String _formatCurrency(num value) {
    ArgumentError.checkNotNull(value, 'value');

    value = value / 100;

    return NumberFormat.currency(
        customPattern: '###,###.##',
        locale: 'pt-BR'
    ).format(value);
  }

  Widget _buildTransactionDateQuestion(BuildContext context) {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        defaultTexts.askTransactionDate,
        style: textStyles.h2TextStyle,
      ),
    );
  }



  Widget _buildButtonNext(BuildContext context) {
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                child: Text(defaultTexts.next),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}