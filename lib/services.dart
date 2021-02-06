import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/sqflite.dart';
import 'package:get_it/get_it.dart';

GetIt services = GetIt.instance;

Future setupServiceLocator() async {
  SQFLite sqfLite = SQFLite();
  sqfLite.db = await sqfLite.initDatabase();

  services.registerSingleton<AppDatabase>(sqfLite);

  return Future.value(1);
}
