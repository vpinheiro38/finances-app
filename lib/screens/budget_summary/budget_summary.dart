import 'package:finances_app/screens/budget_summary/budget_summary_contract.dart';
import 'package:finances_app/screens/budget_summary/budget_summary_view_impl.dart';
import 'package:flutter/material.dart';

class BudgetSummary extends StatefulWidget {
  BudgetSummary();

  @override
  State<StatefulWidget> createState() => _BudgetSummaryState();
}

class _BudgetSummaryState extends State<BudgetSummary> {
  BudgetSummaryView _view;
  BudgetSummaryPresenter _presenter;

  _BudgetSummaryState();

  @override
  void initState() {
    super.initState();

    _view = BudgetSummaryViewImpl();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _view.budget = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return _view.buildContent(context);
  }
}
