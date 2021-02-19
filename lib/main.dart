import 'package:finances_app/model/sqflite.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _openDatabase().then((database) => runApp(Application(database)));
}

Future<SQFLite> _openDatabase() async {
  SQFLite sqfLite = SQFLite();
  sqfLite.db = await sqfLite.initDatabase();

  return sqfLite;
}