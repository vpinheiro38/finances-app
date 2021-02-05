import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/sqflite.dart';
import 'package:get_it/get_it.dart';

GetIt services = GetIt.instance;

void setupServiceLocator() {
  services.registerSingleton<AppDatabase>(SQFLite());
}
