import 'dart:async';

import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/domain/repository/category_repository.dart';
import 'package:expense_tracker/domain/repository/transaction_repository.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

@injectable
class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  final TransactionRepository transactionRepository;
  final WalletRepository walletRepository;
  final CategoryRepository categoryRepository;

  late final StreamSubscription _walletSubscription;
  late final StreamSubscription _categorySubscription;

  AddTransactionBloc(this.transactionRepository, this.walletRepository,
      this.categoryRepository)
      : super(AddTransactionState.initial()) {
    on<_WalletsLoadedEvent>((event, emit) {
      emit(state.copyWith(
          wallets: event.wallets, selectedWallet: event.wallets.first));
    });
    on<_CategoryLoadedEvent>((event, emit) {
      emit(state.copyWith(
          categories: event.categories,
          selectedCategory: event.categories.first));
    });
    on<SelectType>((event, emit) {
      emit(state.copyWith(type: event.type));
    });
    on<SelectCategory>((event, emit) {
      emit(state.copyWith(selectedCategory: event.category));
    });
    on<ExecuteAdd>((event, emit) async {
      final validated = state.formKey.currentState?.validate() ?? false;
      if (validated) {
        final transaction = Transaction(
          id: 0,
          name: state.nameController.text,
          amount: double.parse(state.amountController.text),
          categoryId: state.selectedCategory!.id,
          walletId: state.selectedWallet!.id,
          type: state.type,
          date: DateTime.now(),
        );
        await transactionRepository.insert(transaction);
        emit(state.copyWith(added: true));
      }
    });
    _walletSubscription = walletRepository.watch().listen((wallets) {
      add(_WalletsLoadedEvent(wallets));
    });
    _categorySubscription = categoryRepository.watch().listen((categories) {
      add(_CategoryLoadedEvent(categories));
    });
  }

  @override
  Future<void> close() async {
    super.close();

    _walletSubscription.cancel();
    _categorySubscription.cancel();
  }
}

class _WalletsLoadedEvent extends AddTransactionEvent {
  final List<Wallet> wallets;

  _WalletsLoadedEvent(this.wallets);
}

class _CategoryLoadedEvent extends AddTransactionEvent {
  final List<Category> categories;

  _CategoryLoadedEvent(this.categories);
}
