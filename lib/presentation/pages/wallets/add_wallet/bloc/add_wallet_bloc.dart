import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/domain/entity/currency.dart';
import 'package:expense_tracker/domain/entity/wallet_type.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'add_wallet_event.dart';
part 'add_wallet_state.dart';

@injectable
class AddWalletBloc extends Bloc<AddWalletEvent, AddWalletState> {
  final WalletRepository repository;
  final Wallet? wallet;

  AddWalletBloc(this.repository, @factoryParam this.wallet)
      : super(AddWalletState.initial(wallet)) {
    on<WalletTypeChanged>((event, emit) {
      emit(state.copyWith(selectedType: event.type));
    });
    on<CurrencyChanged>((event, emit) {
      emit(state.copyWith(selectedCurrency: event.currency));
    });
    on<ExecuteAddEvent>((event, emit) async {
      final validated = state.formState.currentState?.validate() ?? false;
      if (validated) {
        final wallet = Wallet(
          id: this.wallet?.id ?? 0,
          name: state.nameController.text,
          type: state.selectedType,
          currency: state.selectedCurrency,
          initialBalance: double.parse(state.initialBalanceController.text),
        );
        if (this.wallet == null) {
          await repository.insert(wallet);
        } else {
          await repository.update(wallet);
        }
        emit(state.copyWith(added: true));
      }
    });
  }
}
