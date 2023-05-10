part of 'add_transaction_bloc.dart';

abstract class AddTransactionEvent {}

class SelectType extends AddTransactionEvent {
  final CategoryType? type;

  SelectType(this.type);
}

class SelectCategory extends AddTransactionEvent {
  final Category category;

  SelectCategory(this.category);
}

class ExecuteAdd extends AddTransactionEvent {}
