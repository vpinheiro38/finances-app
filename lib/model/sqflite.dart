import 'package:finances_app/model/database_contract.dart';
import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/model/models/transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as SQLite;

class SQFLite implements AppDatabase {
  SQLite.Database db;

  @override
  Future<SQLite.Database> initDatabase() async {
    return await SQLite.openDatabase(
        join(await SQLite.getDatabasesPath(), databaseName),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $tableBudgets($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)",
          );
        },
        version: 1
    );
  }

  @override
  Future<Budget> createBudget(Budget budget) async {
    int id = await db.insert(tableBudgets, budget.toMap());
    return Budget.fromInstance(id, budget);
  }

  @override
  Future deleteBudget(int budgetId) async {
    return await db.delete(tableBudgets, where: '$columnId = ?', whereArgs: [budgetId]);
  }

  @override
  Future<Budget> updateBudget(Budget budget) async {
    await db.update(tableBudgets, budget.toMap(), where: '$columnId = ?', whereArgs: [budget.id]);
    return budget;
  }

  @override
  Future<List<Budget>> fetchAllBudgets() async {
    List<Map<String, dynamic>> groups = await db.query(tableBudgets);
    return groups.map((e) => Budget.fromMap(e)).toList();
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    int id = await db.insert(tableBudgets, transaction.toMap());
    return Transaction.fromInstance(id, transaction);
  }

  @override
  Future deleteTransaction(int transactionId) async {
    return await db.delete(tableTransactions, where: '$columnId = ?', whereArgs: [transactionId]);
  }

  @override
  Future<List<Transaction>> fetchAllTransactions(int budgetId) async {
    List<Map<String, dynamic>> groups = await db.query(tableTransactions, where: '$columnBudgetId = ?', whereArgs: [budgetId]);
    return groups.map((e) => Transaction.fromMap(e)).toList();
  }

  @override
  Future updateTransaction(Transaction transaction) async {
    await db.update(tableBudgets, transaction.toMap(), where: '$columnId = ?', whereArgs: [transaction.id]);
    return transaction;
  }
  
}