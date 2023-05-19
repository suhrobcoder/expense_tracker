import 'dart:async';

import 'package:expense_tracker/core/list_extensions.dart';
import 'package:expense_tracker/domain/repository/transaction_repository.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TransactionRepository transactionRepository;
  final WalletRepository walletRepository;

  late final StreamSubscription walletSubscription;
  late final StreamSubscription transactionSubscription;
  late final StreamSubscription budgetsSubscription;
  late final StreamSubscription incomesSubscription;
  late final StreamSubscription expensesSubscription;
  late final StreamSubscription savingsSubscription;

  HomeBloc(this.transactionRepository, this.walletRepository)
      : super(HomeState.initial()) {
    on<_WalletsLoaded>((event, emit) {
      emit(state.copyWith(
        wallets: event.wallets,
        totalBalance: event.wallets.sumOf((wallet) => wallet.currentBalance),
      ));
    });
    on<_TransactionsLoaded>((event, emit) {
      emit(state.copyWith(latestTransactions: event.transactions));
    });
    on<_BudgetLoaded>((event, emit) {
      print(event.budget);
      emit(state.copyWith(budget: event.budget));
    });
    on<_IncomeLoaded>((event, emit) {
      emit(state.copyWith(incomes: event.income));
    });
    on<_ExpenseLoaded>((event, emit) {
      emit(state.copyWith(expenses: event.expense));
    });
    on<_SavingLoaded>((event, emit) {
      emit(state.copyWith(savings: event.saving));
    });
    walletSubscription = walletRepository.watch().listen((wallets) {
      add(_WalletsLoaded(wallets));
    });
    transactionSubscription =
        transactionRepository.latestTransactions().listen((transactions) {
      add(_TransactionsLoaded(transactions));
    });
    budgetsSubscription = transactionRepository.budgets().listen((event) {
      add(_BudgetLoaded(event));
    });
    incomesSubscription = transactionRepository.incomes().listen((event) {
      add(_IncomeLoaded(event));
    });
    expensesSubscription = transactionRepository.expenses().listen((event) {
      add(_ExpenseLoaded(event));
    });
    savingsSubscription = transactionRepository.savings().listen((event) {
      add(_SavingLoaded(event));
    });
  }

  @override
  Future<void> close() async {
    await super.close();

    await walletSubscription.cancel();
    await transactionSubscription.cancel();
  }
}

class _WalletsLoaded extends HomeEvent {
  final List<Wallet> wallets;

  _WalletsLoaded(this.wallets);
}

class _TransactionsLoaded extends HomeEvent {
  final List<Transaction> transactions;

  _TransactionsLoaded(this.transactions);
}

class _BudgetLoaded extends HomeEvent {
  final double budget;

  _BudgetLoaded(this.budget);
}

class _IncomeLoaded extends HomeEvent {
  final double income;

  _IncomeLoaded(this.income);
}

class _ExpenseLoaded extends HomeEvent {
  final double expense;

  _ExpenseLoaded(this.expense);
}

class _SavingLoaded extends HomeEvent {
  final double saving;

  _SavingLoaded(this.saving);
}
