import 'dart:async';

import 'package:expense_tracker/core/list_extensions.dart';
import 'package:expense_tracker/domain/repository/budget_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:injectable/injectable.dart';

part 'budgets_event.dart';
part 'budgets_state.dart';

@injectable
class BudgetsBloc extends Bloc<BudgetsEvent, BudgetsState> {
  final BudgetRepository repository;

  late final StreamSubscription budgetSubscription;

  BudgetsBloc(this.repository) : super(BudgetsState.initial()) {
    on<_BudgetsLoaded>((event, emit) {
      emit(state.copyWith(
          budgets: event.budgets,
          total: event.budgets.sumOf((budget) => budget.amount)));
    });
    on<SelectType>((event, emit) {
      emit(state.copyWith(type: event.type));
    });
    budgetSubscription = repository.watch().listen((event) {
      add(_BudgetsLoaded(event));
    });
  }

  @override
  Future<void> close() async {
    await budgetSubscription.cancel();
    return super.close();
  }
}

class _BudgetsLoaded extends BudgetsEvent {
  final List<Budget> budgets;

  _BudgetsLoaded(this.budgets);
}
