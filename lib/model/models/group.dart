import 'package:finances_app/model/database_contract.dart';
import 'package:flutter/material.dart';

class Group {
  int id;
  String name;

  Group({this.id, @required this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name.replaceAll(' ', '-_-'),
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Group.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName].toString().replaceAll('-_-', ' ');
  }
}