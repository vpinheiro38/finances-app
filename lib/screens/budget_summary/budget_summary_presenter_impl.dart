import 'package:finances_app/model/database_contract.dart';

import 'budget_summary_contract.dart';

class BudgetSummaryPresenterImpl implements BudgetSummaryPresenter {
  final BudgetSummaryView _view;
  final AppDatabase _database;

  BudgetSummaryPresenterImpl(this._view, this._database) {
    //_view.changedBudgetNameCallback = updateBudget;
    //_view.createBudgetCallback = createBudget;
  }

  @override
  void fetchAllTransactions(int budgetId) {
    _database.fetchAllTransactions(budgetId)
        .then((value) => _view.showTransactions(value))
        .catchError((error) => _view.showInfoPopup(error.toString()));
  }

}