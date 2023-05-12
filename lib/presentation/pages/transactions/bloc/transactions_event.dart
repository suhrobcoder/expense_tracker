part of 'transactions_bloc.dart';

abstract class TransactionsEvent {}

class SelectType extends TransactionsEvent {
  final CategoryType? type;

  SelectType(this.type);
}
