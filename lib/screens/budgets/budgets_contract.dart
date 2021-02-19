import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/utils/types.dart';
import 'package:flutter/material.dart';

abstract class BudgetsView {
  Widget buildContent(BuildContext context);

  void showInfoPopup(String message);
  void showBudgets(List<Budget> budgets);
  void addBudget(Budget budget);
  
  set changedBudgetNameCallback(BudgetCallback callback);
  set createBudgetCallback(StringCallback callback);
}

abstract class BudgetsPresenter {
  //VoidCallback initView(BudgetsState state);
  void fetchAllBudgets();
  void createBudget(String budgetName);
  void updateBudget(Budget budget);
}