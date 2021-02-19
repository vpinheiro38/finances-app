import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_first_step.dart';
import 'package:flutter/material.dart';

class TransactionCreation extends StatelessWidget {
  @override
  Widget build(BuildContext rootContext) {
    return Container(
      height: MediaQuery.of(rootContext).size.height/2,
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context) => TransactionCreationFirstStep(
                () => Navigator.pop(rootContext)
            )
        ),
      ),
    );
  }


}