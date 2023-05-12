import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';

abstract class TransactionRepository {
  Future<void> insert(Transaction transaction);
  Stream<List<Transaction>> allTransaction({required CategoryType? type});
  Stream<List<Transaction>> latestTransactions();
  Stream<double> incomes();
  Stream<double> expenses();
  Stream<double> savings();
}
