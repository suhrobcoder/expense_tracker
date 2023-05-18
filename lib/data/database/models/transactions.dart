import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';

@UseRowClass(Transaction)
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get amount => real()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get walletId => integer().references(Wallets, #id)();
  TextColumn get type => textEnum<CategoryType>()();
  DateTimeColumn get date => dateTime()();
}

class Transaction {
  final int id;
  final String name;
  final double amount;
  final int categoryId;
  final int walletId;
  final CategoryType type;
  final DateTime date;
  Category? category;

  Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.categoryId,
    required this.walletId,
    required this.type,
    required this.date,
  });
}
