import 'package:expense_tracker/data/database/dao/statistics_dao.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/stat_data.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/domain/repository/statistics_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StatisticsRepository)
class StatisticsRepositoryImpl extends StatisticsRepository {
  final StatisticsDao dao;

  StatisticsRepositoryImpl(this.dao);

  @override
  Future<List<StatData>> getStatistics() {
    return dao.getStats();
  }

  @override
  Future<List<Category>> getCategoriesWithTransactionCount(
      {required CategoryType type}) {
    return dao.getCategoriesWithTransactionCount(type: type);
  }
}
