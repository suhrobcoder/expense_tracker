import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';

@UseRowClass(Budget)
class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get amount => real()();
  IntColumn get walletId => integer().references(Wallets, #id)();
  IntColumn get categoryId => integer().references(Categories, #id)();
}

class Budget {
  final int id;
  final String name;
  final double amount;
  final int walletId;
  final int categoryId;
  double currentUse;

  Budget({
    required this.id,
    required this.name,
    required this.amount,
    required this.walletId,
    required this.categoryId,
    this.currentUse = -1.0,
  });
}
