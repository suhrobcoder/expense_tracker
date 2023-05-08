import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/dao/category_dao.dart';
import 'package:expense_tracker/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDao dao;

  CategoryRepositoryImpl(this.dao);

  @override
  Future<void> insert(Category category) {
    return dao.insert(_mapCategory(category));
  }

  @override
  Future<void> update(Category category) {
    return dao.updateCategory(_mapCategory(category));
  }

  @override
  Stream<List<Category>> watch() {
    return dao.watch();
  }

  CategoriesCompanion _mapCategory(Category category) {
    return CategoriesCompanion.insert(
      name: category.name,
      icon: category.icon,
      color: category.color,
      type: category.type,
    );
  }
}
