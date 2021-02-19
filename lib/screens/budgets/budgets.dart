import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/screens/budgets/budgets_contract.dart';
import 'package:finances_app/screens/budgets/budgets_presenter_impl.dart';
import 'package:finances_app/screens/budgets/budgets_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Budgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  BudgetsView _view;
  BudgetsPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _view = BudgetsViewImpl();
    _presenter = BudgetsPresenterImpl(_view, context.read<AppDatabase>());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _presenter.fetchAllBudgets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _view.buildContent(context);
  }
}
