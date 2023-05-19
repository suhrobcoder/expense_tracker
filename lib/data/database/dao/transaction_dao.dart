import 'package:drift/drift.dart';
import 'package:expense_tracker/core/list_extensions.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:injectable/injectable.dart';

part 'transaction_dao.g.dart';

@injectable
@DriftAccessor(tables: [Transactions, Categories, Budgets])
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.attachedDatabase);

  Future<void> insert(TransactionsCompanion transaction) {
    return into(transactions).insert(transaction);
  }

  Stream<List<Transaction>> allTransactions({
    required CategoryType? type,
  }) {
    if (type == null) {
      return (select(transactions).join([
        innerJoin(categories, categories.id.equalsExp(transactions.id)),
      ])
            ..orderBy([OrderingTerm.desc(transactions.date)]))
          .map((row) =>
              row.readTable(transactions)..category = row.readTable(categories))
          .watch();
    } else {
      return ((select(transactions).join([
        innerJoin(categories, categories.id.equalsExp(transactions.id)),
      ])
            ..where(transactions.type.equalsValue(type)))
            ..orderBy([OrderingTerm.desc(transactions.date)]))
          .map((row) =>
              row.readTable(transactions)..category = row.readTable(categories))
          .watch();
    }
  }

  Stream<List<Transaction>> latestTransactions() {
    return ((select(transactions).join([
      innerJoin(categories, categories.id.equalsExp(transactions.id)),
    ]))
          ..limit(5)
          ..orderBy([OrderingTerm.desc(transactions.date)]))
        .map((row) =>
            row.readTable(transactions)..category = row.readTable(categories))
        .watch();
  }

  Stream<double> getBudgetUse() {
    return select(budgets)
        .addColumns([transactions.amount.sum()])
        .join([
          innerJoin(
              transactions,
              transactions.categoryId.equalsExp(budgets.categoryId) &
                  transactions.walletId.equalsExp(budgets.walletId)),
        ])
        .map((row) => row.readTable(budgets)
          ..currentUse = row.read(transactions.amount.sum()) ?? 0.0)
        .watch()
        .map((list) =>
            list.sumOf((budget) => budget.amount - budget.currentUse));
  }

  Stream<double> incomes() {
    return (select(transactions).addColumns([transactions.amount.sum()])
          ..where(transactions.type.equals(CategoryType.income.name)))
        .map((row) => row.read(transactions.amount.sum()))
        .watch()
        .map((event) => event.sumOf((i) => i ?? 0.0));
  }

  Stream<double> expenses() {
    return (select(transactions).addColumns([transactions.amount.sum()])
          ..where(transactions.type.equals(CategoryType.expense.name)))
        .map((row) => row.read(transactions.amount.sum()))
        .watch()
        .map((event) => event.sumOf((i) => i ?? 0.0));
  }

  Stream<double> savings() {
    return (select(transactions).addColumns([transactions.amount.sum()])
          ..where(transactions.type.equals(CategoryType.saving.name)))
        .map((row) => row.read(transactions.amount.sum()))
        .watch()
        .map((event) => event.sumOf((i) => i ?? 0.0));
  }
}
