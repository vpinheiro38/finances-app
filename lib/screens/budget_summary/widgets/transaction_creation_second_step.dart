import 'package:finances_app/model/models/transaction.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_content.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_third_step.dart';
import 'package:finances_app/screens/budgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TransactionCreationSecondStep extends StatefulWidget {
  final Transaction _transactionBeingCreated;

  TransactionCreationSecondStep(this._transactionBeingCreated);

  @override
  State<StatefulWidget> createState() => _TransactionCreationSecondStepState(_transactionBeingCreated);
}

class _TransactionCreationSecondStepState extends State<TransactionCreationSecondStep> {
  final Transaction _transactionBeingCreated;

  CalendarController _calendarController;

  _TransactionCreationSecondStepState(this._transactionBeingCreated);

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TransactionCreationContent(
        children: [
          _buildTransactionDateQuestion(context),
          _buildTransactionCreationCalendar(),
          _buildButtonNext(context)
        ], 
        onPopButtonPressed: () => Navigator.pop(context)
    );
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

  Widget _buildTransactionCreationCalendar() {
    return Calendar(_calendarController);
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
                onPressed: () => _onNextButtonPressed(context),
                child: Text(defaultTexts.next),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  void _onNextButtonPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionCreationThirdStep(_transactionBeingCreated)));
  }
  
}