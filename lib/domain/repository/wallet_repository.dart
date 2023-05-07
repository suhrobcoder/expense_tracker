import 'package:expense_tracker/data/database/app_database.dart';

abstract class WalletRepository {
  Future<void> insert(Wallet wallet);
  Future<void> update(Wallet wallet);
  Future<void> delete(Wallet wallet);
  Stream<List<Wallet>> watch();
}
