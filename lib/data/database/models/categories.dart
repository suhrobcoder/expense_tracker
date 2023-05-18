import 'package:drift/drift.dart';

import 'package:expense_tracker/domain/entity/category_type.dart';

@UseRowClass(Category)
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  IntColumn get color => integer()();
  TextColumn get type => textEnum<CategoryType>()();
}

class Category {
  final int id;
  final String name;
  final String icon;
  final int color;
  final CategoryType type;
  int transactionCount;
  double amount;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.type,
    this.transactionCount = -1,
    this.amount = 0.0,
  });
}
