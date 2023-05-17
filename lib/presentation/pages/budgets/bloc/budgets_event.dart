part of 'budgets_bloc.dart';

abstract class BudgetsEvent {}

class SelectType extends BudgetsEvent {
  final CategoryType type;

  SelectType(this.type);
}
