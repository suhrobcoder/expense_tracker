import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:injectable/injectable.dart';

part 'transaction_dao.g.dart';

@injectable
@DriftAccessor(tables: [Transactions, Categories])
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
    return (select(transactions)
          ..limit(5)
          ..orderBy([(u) => OrderingTerm.desc(u.date)]))
        .watch();
  }
}
