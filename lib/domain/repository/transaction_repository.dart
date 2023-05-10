import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';

abstract class TransactionRepository {
  Future<void> insert(Transaction transaction);
  Stream<List<Transaction>> allTransaction({required CategoryType type});
  Stream<List<Transaction>> latestTransactions();
}
