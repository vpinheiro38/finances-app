import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/utils/utils.dart';

class Transaction {
  final int id;
  final int budgetId;
  int date;
  String category;
  double moneyAmount;
  String agentInvolved;

  Transaction(this.budgetId, this.date, this.category, this.moneyAmount, this.agentInvolved, {this.id});

  Transaction.fromInstance(this.id, Transaction transaction) :
    budgetId = transaction.budgetId,
    date = transaction.date,
    category = transaction.category,
    moneyAmount = transaction.moneyAmount,
    agentInvolved = transaction.agentInvolved;

  Transaction.fromMap(Map<String, dynamic> map) :
    id = map[columnId],
    budgetId = map[columnBudgetId],
    date = map[columnDate],
    category = map[columnCategory],
    moneyAmount = map[columnMoneyAmount],
    agentInvolved = StringEncoder.decodeWhitespaces(map[columnAgentInvolved].toString());

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnBudgetId: budgetId,
      columnCategory: category,
      columnMoneyAmount: moneyAmount,
      columnAgentInvolved: StringEncoder.encodeWhitespaces(agentInvolved),
      columnDate: date
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}