import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/dao/wallet_dao.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletDao dao;

  WalletRepositoryImpl(this.dao);

  @override
  Future<void> insert(Wallet wallet) {
    return dao.insert(_mapWallet(wallet));
  }

  @override
  Future<void> update(Wallet wallet) {
    return dao.updateWallet(_mapWallet(wallet));
  }

  @override
  Future<void> delete(Wallet wallet) {
    return dao.deleteWallet(_mapWallet(wallet));
  }

  @override
  Stream<List<Wallet>> watch() {
    return dao.watchWallets();
  }

  WalletsCompanion _mapWallet(Wallet wallet) {
    return WalletsCompanion.insert(
      name: wallet.name,
      type: wallet.type,
      currency: wallet.currency,
      initialBalance: wallet.initialBalance,
    );
  }
}
