import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:injectable/injectable.dart';

part 'budget_dao.g.dart';

@injectable
@DriftAccessor(tables: [Budgets, Transactions])
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
              transactions, transactions.walletId.equalsExp(budgets.categoryId))
        ])
        .map((row) => row.readTable(budgets)
          ..currentUse = row.read(transactions.amount.sum()) ?? -1.0)
        .watch();
  }
}
