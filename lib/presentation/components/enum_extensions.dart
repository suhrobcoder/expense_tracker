import 'package:expense_tracker/domain/entity/wallet_type.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

extension WalletTypeExt on WalletType {
  Color getColor() {
    switch (this) {
      case WalletType.cash:
        return blueGreen;
      case WalletType.bankAccount:
        return green;
      case WalletType.eWallet:
        return blue;
      case WalletType.crypto:
        return purple;
    }
  }

  String getIcon() {
    switch (this) {
      case WalletType.cash:
        return "assets/icons/wallet2.svg";
      case WalletType.bankAccount:
        return "assets/icons/bank.svg";
      case WalletType.eWallet:
        return "assets/icons/digital-wallet.svg";
      case WalletType.crypto:
        return "assets/icons/crypto-wallet.svg";
    }
  }
}
