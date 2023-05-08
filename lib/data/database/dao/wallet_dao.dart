import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:injectable/injectable.dart';

part 'wallet_dao.g.dart';

@injectable
@DriftAccessor(tables: [Wallets])
class WalletDao extends DatabaseAccessor<AppDatabase> with _$WalletDaoMixin {
  WalletDao(AppDatabase database) : super(database);

  Future<void> insert(WalletsCompanion wallet) {
    return into(wallets).insert(wallet);
  }

  Future<void> updateWallet(WalletsCompanion wallet) {
    return update(wallets).replace(wallet);
  }

  Future<void> deleteWallet(WalletsCompanion wallet) {
    return delete(wallets).delete(wallet);
  }

  Stream<List<Wallet>> watchWallets() {
    return select(wallets).watch();
  }
}
