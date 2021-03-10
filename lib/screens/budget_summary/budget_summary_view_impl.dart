import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/model/models/transaction.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budget_summary/budget_summary_contract.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_card.dart';
import 'package:finances_app/screens/budget_summary/widgets/transaction_creation.dart';
import 'package:finances_app/widgets/dialog_popup.dart';
import 'package:finances_app/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class BudgetSummaryViewImpl implements BudgetSummaryView  {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Budget _budget;
  BuildContext _context;

  List<TransactionItem> _transactionWidgetList = [];

  BudgetSummaryViewImpl();

  @override
  Widget buildContent(BuildContext context) {
    _context = context;

    return PageScaffold(
        header: _buildHeader(),
        child: _buildBody()
    );
  }

  Widget _buildHeader() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(6, 10, 20, 20),
        child: Row(
          children: [
            _buildReturnButton(),
            _buildHeaderTitle(),
            _buildHeaderCreateTransactionButton()
          ],
        )
    );
  }

  Widget _buildReturnButton() {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.textColor),
        onPressed: () => Navigator.pop(_context),
        padding: const EdgeInsets.all(0));
  }

  Widget _buildHeaderTitle() {
    TextStyles textStyles = Provider.of<AppTheme>(_context, listen: false).textStyles;

    return Expanded(
        child: Text("${_budget.name}",
            style: textStyles.h1TextStyle));
  }

  Widget _buildHeaderCreateTransactionButton() {
    return IconButton(
        icon: Icon(Icons.add, color: AppColors.textColor),
        onPressed: () => _onCreateTransactionButtonPressed()
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        ..._transactionWidgetList
      ]
    );
  }

  void _onCreateTransactionButtonPressed() {
    showMaterialModalBottomSheet(
      context: _context,
      expand: false,
      enableDrag: false,
      backgroundColor: AppColors.cardColor,
      builder: (context) => TransactionCreation(_budget.id)
    );
  }

  @override
  void showTransactions(List<Transaction> transactions) {
    Future delay = Future((){});
    transactions.forEach((transaction) {
      delay = delay.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _transactionWidgetList.insert(0, TransactionItem(transaction.category, transaction.moneyAmount, transaction.agentInvolved, DateTime.fromMillisecondsSinceEpoch(transaction.date)));
          _listKey.currentState.insertItem(_transactionWidgetList.length - 1);
        });
      });
    });
  }

  @override
  void showInfoPopup(String message){
    var dialog = DialogPopup.buildDialog(
        message: message,
        confirm: "OK",
        confirmFn: () => Navigator.pop(_context));
    showDialog(context: _context, child: dialog);
  }

  set budget(value) {
    _budget = value;
  }

  get budget => (_budget == null) ? Budget("") : _budget;

}
