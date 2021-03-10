import 'package:finances_app/screens/budget_summary/widgets/transaction_creation_header.dart';
import 'package:flutter/material.dart';

class TransactionCreationContent extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onPopButtonPressed;
  final IconData returnIcon;

  TransactionCreationContent({@required this.children, @required this.onPopButtonPressed, this.returnIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TransactionCreationHeader(onPopButtonPressed, iconData: returnIcon),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }

}