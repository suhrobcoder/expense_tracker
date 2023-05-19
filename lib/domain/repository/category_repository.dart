import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';

abstract class CategoryRepository {
  Future<void> insert(Category category);
  Future<void> update(Category category);
  Stream<List<Category>> watch({required CategoryType type});
}
