import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/model/models/transaction.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionCreationThirdStep extends StatefulWidget {
  final Transaction _transactionBeingCreated;

  TransactionCreationThirdStep(this._transactionBeingCreated);

  @override
  State<StatefulWidget> createState() => _TransactionCreationThirdStepState(_transactionBeingCreated);
}

class _TransactionCreationThirdStepState extends State<TransactionCreationThirdStep> {
  final Transaction _transactionBeingCreated;
  List<String> _categories;

  _TransactionCreationThirdStepState(this._transactionBeingCreated);

  @override
  void initState() {
    super.initState();

    _categories = ['Outros', 'Two', 'Free', 'Four' ];
  }

  @override
  Widget build(BuildContext context) {
    return TransactionCreationContent(
        children: [
          _buildAgentInvolvedQuestion(),
          _buildAgentInvolvedInput(),
          _buildCategoryQuestion(),
          _buildCategorySelection(),
          _buildButtonNext()
        ],
        onPopButtonPressed: () => Navigator.pop(context)
    );
  }

  Widget _buildAgentInvolvedQuestion() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        (_transactionBeingCreated.moneyAmount < 0) ? defaultTexts.askTransactionOutflowAgent : defaultTexts.askTransactionInflowAgent,
        style: textStyles.h2TextStyle,
      ),
    );
  }

  Widget _buildAgentInvolvedInput() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      child: TextField(
        //controller: _textEditingController,
        //onChanged: _onMoneyInputChanged,
        keyboardType: TextInputType.number,
        style: textStyles.largeBodyTextStyle,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: defaultTexts.enterText,
            hintStyle: textStyles.grayTextStyle
        ),
      ),
    );
  }

  Widget _buildCategoryQuestion() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        defaultTexts.askTransactionCategory,
        style: textStyles.h2TextStyle,
      ),
    );
  }

  Widget _buildCategorySelection() {
    TextStyles textStyles = Provider.of<AppTheme>(context, listen: false).textStyles;

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: _categories.map((category) => _buildCategorySelectionRadio(
            category,
            Text(category, style: textStyles.bodyTextStyle)
        )).toList(),
      ),
    );
  }

  Widget _buildCategorySelectionRadio(String transactionCategory, Text title) {
    return ListTile(
      title: title,
      contentPadding: const EdgeInsets.all(0),
      leading: Radio(
        activeColor: AppColors.textColor,
        hoverColor: AppColors.textColor,
        value: transactionCategory,
        groupValue: _transactionBeingCreated.category,
        onChanged: (String newCategory) {
          setState(() {
            _transactionBeingCreated.category = newCategory;
          });
        },
      ),
    );
  }

  Widget _buildButtonNext() {
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(context, listen: false);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              child: Text(defaultTexts.create),
            ),
          )
        ],
      ),
    );
  }
}