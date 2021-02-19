import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/screens/budgets/budgets_contract.dart';

class BudgetsPresenterImpl implements BudgetsPresenter {
  final BudgetsView _view;
  final AppDatabase _database;

  BudgetsPresenterImpl(this._view, this._database) {
    _view.changedBudgetNameCallback = updateBudget;
    _view.createBudgetCallback = createBudget;
  }

  @override
  void updateBudget(Budget budget) {
    _database.updateBudget(budget);
  }

  @override
  void createBudget(String budgetName) {
    _database.createBudget(Budget(budgetName))
        .then((budget) => _view.addBudget(budget))
        .catchError((error) => _view.showInfoPopup(error.toString()));
  }

  @override
  void fetchAllBudgets() {
    _database.fetchAllBudgets()
        .then((value) => _view.showBudgets(value))
        .catchError((error) => _view.showInfoPopup(error.toString()));
  }

}