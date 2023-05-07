part of 'add_wallet_bloc.dart';

abstract class AddWalletEvent {}

class WalletTypeChanged extends AddWalletEvent {
  final WalletType? type;

  WalletTypeChanged(this.type);
}

class CurrencyChanged extends AddWalletEvent {
  final String? currency;

  CurrencyChanged(this.currency);
}

class ExecuteAddEvent extends AddWalletEvent {}
