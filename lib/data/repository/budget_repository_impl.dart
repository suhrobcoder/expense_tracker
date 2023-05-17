import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/dao/budget_dao.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/domain/repository/budget_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BudgetRepositoryImpl extends BudgetRepository {
  final BudgetDao dao;

  BudgetRepositoryImpl(this.dao);

  @override
  Future<void> insert(Budget budget) {
    return dao.insert(_mapBudget(budget));
  }

  @override
  Future<void> update(Budget budget) {
    return dao.updateBudget(_mapBudget(budget));
  }

  @override
  Future<void> delete(Budget budget) {
    return dao.deleteBudget(_mapBudget(budget));
  }

  @override
  Stream<List<Budget>> watch() {
    return dao.watch();
  }

  BudgetsCompanion _mapBudget(Budget budget) {
    return BudgetsCompanion.insert(
      name: budget.name,
      amount: budget.amount,
      walletId: budget.walletId,
      categoryId: budget.categoryId,
    );
  }
}
