import 'package:finances_app/model/models/transaction.dart';
import 'package:flutter/material.dart';

abstract class BudgetSummaryView {
  Widget buildContent(BuildContext context);

  void showTransactions(List<Transaction> transactions);
  void showInfoPopup(String message);

  set budget(value);
}

abstract class BudgetSummaryPresenter {
  void fetchAllTransactions(int budgetId);
}