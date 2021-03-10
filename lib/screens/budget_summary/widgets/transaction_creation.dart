import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_first_step.dart';
import 'package:flutter/material.dart';

class TransactionCreation extends StatelessWidget {
  final int _budgetId;

  TransactionCreation(this._budgetId);

  @override
  Widget build(BuildContext rootContext) {
    return Container(
      height: 3*MediaQuery.of(rootContext).size.height/4,
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context) => TransactionCreationFirstStep(
              _budgetId,
                () => Navigator.pop(rootContext)
            )
        ),
      ),
    );
  }


}