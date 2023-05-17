part of 'add_budget_bloc.dart';

abstract class AddBudgetEvent {}

class SelectWallet extends AddBudgetEvent {
  final Wallet? wallet;

  SelectWallet(this.wallet);
}

class SelectCategory extends AddBudgetEvent {
  final Category? category;

  SelectCategory(this.category);
}

class ExecuteAdd extends AddBudgetEvent {}
