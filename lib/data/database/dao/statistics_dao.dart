import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/stat_data.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part 'statistics_dao.g.dart';

@injectable
@DriftAccessor(tables: [Transactions, Categories])
class StatisticsDao extends DatabaseAccessor<AppDatabase>
    with _$StatisticsDaoMixin {
  StatisticsDao(super.attachedDatabase);

  Future<List<StatData>> getStats() async {
    final data = await (select(transactions)
          ..orderBy([(table) => OrderingTerm.desc(table.date)]))
        .get();
    final grouped = data
        .groupListsBy((element) => DateFormat("MMM yyyy").format(element.date));
    return grouped.entries.map((group) {
      double expense = 0.0;
      double income = 0.0;
      for (final item in group.value) {
        if (item.type == CategoryType.expense) {
          expense += item.amount;
        } else if (item.type == CategoryType.income) {
          income += item.amount;
        }
      }
      return StatData(expense: expense, income: income, date: group.key);
    }).toList();
  }

  Future<List<Category>> getCategoriesWithTransactionCount() {
    return (select(categories).addColumns([
      transactions.id.count(),
      transactions.amount.sum(),
    ]).join([
      leftOuterJoin(
          transactions, transactions.categoryId.equalsExp(categories.id)),
    ])
          ..groupBy([categories.id]))
        .map((row) => row.readTable(categories)
          ..transactionCount = row.read(transactions.id.count()) ?? 0
          ..amount = row.read(transactions.amount.sum()) ?? 0.0)
        .get();
  }
}
