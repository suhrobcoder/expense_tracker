import 'package:expense_tracker/data/database/app_database.dart';

abstract class CategoryRepository {
  Future<void> insert(Category category);
  Future<void> update(Category category);
  Stream<List<Category>> watch();
}
