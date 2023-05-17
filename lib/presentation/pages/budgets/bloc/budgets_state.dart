part of 'budgets_bloc.dart';

class BudgetsState extends Equatable {
  const BudgetsState({
    required this.total,
    required this.type,
    required this.budgets,
  });

  final double total;
  final CategoryType type;
  final List<Budget> budgets;

  factory BudgetsState.initial() {
    return const BudgetsState(
      total: -1.0,
      type: CategoryType.expense,
      budgets: [],
    );
  }

  BudgetsState copyWith({
    double? total,
    CategoryType? type,
    List<Budget>? budgets,
  }) {
    return BudgetsState(
      total: total ?? this.total,
      type: type ?? this.type,
      budgets: budgets ?? this.budgets,
    );
  }

  @override
  List<Object> get props => [total, type, budgets];
}
