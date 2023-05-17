import 'package:expense_tracker/data/database/models/budgets.dart';

abstract class BudgetRepository {
  Future<void> insert(Budget budget);
  Future<void> update(Budget budget);
  Future<void> delete(Budget budget);
  Stream<List<Budget>> watch();
}
