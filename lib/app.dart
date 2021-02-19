import 'package:finances_app/constants/app_colors.dart';
import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/provider/app_theme.dart';
import 'package:finances_app/provider/default_texts.dart';
import 'package:finances_app/screens/budget_summary/budget_summary.dart';
import 'package:finances_app/screens/budgets/budgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  final AppDatabase _database;

  Application(this._database);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScreenTap(context),
      child: _buildAppWidget()
    );
  }

  void _onScreenTap(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
      currentFocus.focusedChild.unfocus();
  }

  Widget _buildAppWidget() {
    return MultiProvider(
        providers: [
          Provider(create: (_) => AppTheme()),
          Provider(create: (_) => DefaultTexts()),
          Provider(create: (_) => _database)
        ],
        child: _buildMaterialApp()
    );
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      theme: ThemeData(
        unselectedWidgetColor: AppColors.hintTextColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/summary': (context) => BudgetSummary()
      },
      home: Budgets(),
    );
  }
}