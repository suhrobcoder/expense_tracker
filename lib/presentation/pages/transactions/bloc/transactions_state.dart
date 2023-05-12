part of 'transactions_bloc.dart';

class TransactionsState extends Equatable {
  const TransactionsState({
    required this.type,
    required this.transactions,
  });

  final CategoryType? type;
  final Map<String, List<Transaction>> transactions;

  factory TransactionsState.initial() {
    return const TransactionsState(
      type: null,
      transactions: {},
    );
  }

  TransactionsState copyWith({
    CategoryType? type,
    Map<String, List<Transaction>>? transactions,
  }) {
    return TransactionsState(
      type: type ?? this.type,
      transactions: transactions ?? this.transactions,
    );
  }

  TransactionsState removeType() {
    return TransactionsState(
      type: null,
      transactions: transactions,
    );
  }

  @override
  List<Object?> get props => [type, transactions];
}
