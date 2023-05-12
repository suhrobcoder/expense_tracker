import 'package:collection/collection.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/domain/repository/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:injectable/injectable.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionRepository repository;

  TransactionsBloc(this.repository) : super(TransactionsState.initial()) {
    on<_TransactionsLoaded>((event, emit) {
      emit(state.copyWith(transactions: event.transactions));
    });
    on<SelectType>((event, emit) {
      if (event.type == null) {
        emit(state.removeType());
      } else {
        emit(state.copyWith(type: event.type));
      }
      loadTransactions();
    });
    loadTransactions();
  }

  void loadTransactions() async {
    final transactions =
        await repository.allTransaction(type: state.type).first;
    final grouped = transactions
        .groupListsBy((element) => element.date.toString()); //TODO format date
    add(_TransactionsLoaded(grouped));
  }
}

class _TransactionsLoaded extends TransactionsEvent {
  final Map<String, List<Transaction>> transactions;

  _TransactionsLoaded(this.transactions);
}
