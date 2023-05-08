import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:injectable/injectable.dart';

part 'category_dao.g.dart';

@injectable
@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.attachedDatabase);

  Future<void> insert(CategoriesCompanion category) {
    return into(categories).insert(category);
  }

  Future<void> updateCategory(CategoriesCompanion category) {
    return update(categories).replace(category);
  }

  Stream<List<Category>> watch() {
    return select(categories).watch();
  }
}
