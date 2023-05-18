import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/stat_data.dart';

abstract class StatisticsRepository {
  Future<List<StatData>> getStatistics();
  Future<List<Category>> getCategoriesWithTransactionCount();
}
