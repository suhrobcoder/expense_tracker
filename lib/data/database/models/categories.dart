import 'package:drift/drift.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  IntColumn get color => integer()();
  TextColumn get type => textEnum<CategoryType>()();
}
