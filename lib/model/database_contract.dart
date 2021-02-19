import 'dart:async';
import 'package:finances_app/model/models/budget.dart';
import 'package:finances_app/model/models/transaction.dart';

const String databaseName = "finances.db";

const String tableBudgets = "Budgets";
const String columnId = "id";
const String columnName = "name";

const String tableTransactions = "Transactions";
const String columnBudgetId = "budgetId";
const String columnCategory = "category";
const String columnMoneyAmount = "moneyAmount";
const String columnAgentInvolved = "agentInvolved";
const String columnDate = "date";

abstract class AppDatabase {
  void initDatabase();
  Future<List<Budget>> fetchAllBudgets();
  Future<Budget> createBudget(Budget budget);
  Future updateBudget(Budget budget);
  Future deleteBudget(int budgetId);

  Future<List<Transaction>> fetchAllTransactions(int budgetId);
  Future<Transaction> createTransaction(Transaction transaction);
  Future updateTransaction(Transaction transaction);
  Future deleteTransaction(int transactionId);
}