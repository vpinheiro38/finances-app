import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/provider/text_styles.dart';
import 'package:finances_app/screens/budgets/widgets/budget_card.dart';
import 'package:finances_app/utils/types.dart';
import 'package:finances_app/widgets/dialog_popup.dart';
import 'package:finances_app/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'budgets_contract.dart';

class BudgetsViewImpl extends BudgetsView {
  final Tween<Offset> _slideOffset = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  final Tween<double> _slideFade = Tween(begin: 0, end: 1);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  BudgetCallback _changedBudgetNameCallback;
  StringCallback _createBudgetCallback;

  BuildContext _context;
  List<Budget> _budgetList = [];

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
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Row(
          children: [
            _buildHeaderTitle(),
            _buildHeaderAddBudgetIcon()
          ],
        )
    );
  }

  Widget _buildHeaderTitle() {
    TextStyles textStyles = Provider.of<AppTheme>(_context, listen: false).textStyles;
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(_context, listen: false);

    return Expanded(
        child: Text(
            defaultTexts.appTitle,
            style: textStyles.h1TextStyle
        )
    );
  }

  Widget _buildHeaderAddBudgetIcon() {
    DefaultTexts defaultTexts = Provider.of<DefaultTexts>(_context, listen: false);

    return IconButton(
        icon: Icon(
            Icons.add,
            color: AppColors.textColor
        ),
        onPressed: () => _createBudgetCallback(defaultTexts.newBudget)
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: _buildBudgetsCardList()
    );
  }

  Widget _buildBudgetsCardList() {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _budgetList.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_slideOffset),
            child: FadeTransition(
              opacity: animation.drive(_slideFade),
              child: BudgetCard(_budgetList[index].name,
                      (newName) => _budgetList[index].name = newName,
                      () => _changedBudgetNameCallback(_budgetList[index]),
                      () => navigateToDashboard(_budgetList[index])
              ),
            ),
          );
        }
    );
  }

  @override
  void showBudgets(List<Budget> budgetList) {
    Future delay = Future((){});
    budgetList.forEach((budget) {
      delay = delay.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _budgetList.add(budget);
          _listKey.currentState.insertItem(_budgetList.length - 1);
        });
      });
    });
  }

  @override
  void addBudget(Budget budget) {
    _budgetList.add(budget);
    _listKey.currentState.insertItem(_budgetList.length - 1);
  }

  @override
  void showInfoPopup(String message){
    var dialog = DialogPopup.buildDialog(
        message: message,
        confirm: "OK",
        confirmFn: () => Navigator.pop(_context));
    showDialog(context: _context, child: dialog);
  }

  void navigateToDashboard(Budget budget) {
    //Navigator.push(_context, MaterialPageRoute(builder: (context) => BudgetSummary(budget)));
    Navigator.pushNamed(_context, '/summary', arguments: budget);
  }

  @override
  set changedBudgetNameCallback(callback) {
    _changedBudgetNameCallback = callback;
  }

  @override
  set createBudgetCallback(callback) {
    _createBudgetCallback = callback;
  }

}