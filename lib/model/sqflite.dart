import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/group.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFLite implements AppDatabase {
  Database db;

  @override
  Future<Database> initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $tableGroups($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)",
          );
        },
        version: 1
    );
  }

  @override
  Future<Group> createGroup(Group group) async {
    group.id = await db.insert(tableGroups, group.toMap());
    return group;
  }

  @override
  Future deleteGroup(int id) async {
    return await db.delete(tableGroups, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<Group> updateGroup(Group group) async {
    await db.update(tableGroups, group.toMap(), where: '$columnId = ?', whereArgs: [group.id]);
    return group;
  }

  @override
  Future<List<Group>> fetchAllGroups() async {
    List<Map<String, dynamic>> groups = await db.query(tableGroups);
    return groups.map((e) => Group.fromMap(e)).toList();
  }
  
}