import 'package:drift/drift.dart';
import 'package:expense_tracker/domain/entity/wallet_type.dart';

@UseRowClass(Wallet)
class Wallets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => textEnum<WalletType>()();
  TextColumn get currency => text()();
  RealColumn get initialBalance => real()();
}

class Wallet {
  final int id;
  final String name;
  final WalletType type;
  final String currency;
  final double initialBalance;
  double currentBalance;

  Wallet({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    required this.initialBalance,
    this.currentBalance = -1.0,
  });
}
