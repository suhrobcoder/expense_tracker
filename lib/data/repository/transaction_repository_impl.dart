import 'package:expense_tracker/data/database/dao/transaction_dao.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/domain/repository/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionDao dao;

  TransactionRepositoryImpl(this.dao);

  @override
  Future<void> insert(Transaction transaction) {
    return dao.insert(_mapTransaction(transaction));
  }

  @override
  Stream<List<Transaction>> allTransaction({required CategoryType type}) {
    return dao.allTransactions(type: type);
  }

  @override
  Stream<List<Transaction>> latestTransactions() {
    return dao.latestTransactions();
  }

  TransactionsCompanion _mapTransaction(Transaction transaction) {
    return TransactionsCompanion.insert(
      name: transaction.name,
      amount: transaction.amount,
      categoryId: transaction.categoryId,
      walletId: transaction.walletId,
      type: transaction.type,
      date: transaction.date,
    );
  }
}
