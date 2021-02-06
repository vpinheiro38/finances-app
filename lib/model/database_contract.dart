import 'dart:async';
import 'package:finances_app/model/models/group.dart';

const String databaseName = "finances.db";

const String tableGroups = "Groups";
const String columnId = "id";
const String columnName = "name";

abstract class AppDatabase {
  void initDatabase();
  Future<List<Group>> fetchAllGroups();
  Future<Group> createGroup(Group group);
  Future updateGroup(Group group);
  Future deleteGroup(int id);
}