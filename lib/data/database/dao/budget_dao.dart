import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:injectable/injectable.dart';

part 'budget_dao.g.dart';

@injectable
@DriftAccessor(tables: [Budgets, Transactions, Categories])
class BudgetDao extends DatabaseAccessor<AppDatabase> with _$BudgetDaoMixin {
  BudgetDao(super.attachedDatabase);

  Future<void> insert(BudgetsCompanion budget) {
    return into(budgets).insert(budget);
  }

  Future<void> updateBudget(BudgetsCompanion budget) {
    return update(budgets).replace(budget);
  }

  Future<void> deleteBudget(BudgetsCompanion budget) {
    return delete(budgets).delete(budget);
  }

  Stream<List<Budget>> watch() {
    return select(budgets)
        .addColumns([transactions.amount.sum()])
        .join([
          innerJoin(
              transactions,
              transactions.categoryId.equalsExp(budgets.categoryId) &
                  transactions.walletId.equalsExp(budgets.walletId)),
          innerJoin(categories, categories.id.equalsExp(budgets.categoryId)),
        ])
        .map((row) => row.readTable(budgets)
          ..currentUse = row.read(transactions.amount.sum()) ?? -1.0
          ..category = row.readTable(categories))
        .watch();
  }
}
