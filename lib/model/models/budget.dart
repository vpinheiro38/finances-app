import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/utils/utils.dart';

class Budget {
  final int id;
  String name;

  Budget(this.name, {this.id});

  Budget.fromInstance(this.id, Budget budget) {
    name = budget.name;
  }

  Budget.fromMap(Map<String, dynamic> map) :
    id = map[columnId],
    name = StringEncoder.decodeWhitespaces(map[columnName].toString());

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: StringEncoder.encodeWhitespaces(name),
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}