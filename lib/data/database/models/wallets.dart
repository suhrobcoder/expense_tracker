import 'package:drift/drift.dart';
import 'package:expense_tracker/domain/entity/wallet_type.dart';

class Wallets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => textEnum<WalletType>()();
  TextColumn get currency => text()();
  RealColumn get initialBalance => real()();
}
