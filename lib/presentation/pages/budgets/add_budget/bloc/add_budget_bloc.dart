import 'package:collection/collection.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/domain/repository/budget_repository.dart';
import 'package:expense_tracker/domain/repository/category_repository.dart';
import 'package:expense_tracker/domain/repository/wallet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'add_budget_event.dart';
part 'add_budget_state.dart';

@injectable
class AddBudgetBloc extends Bloc<AddBudgetEvent, AddBudgetState> {
  final BudgetRepository budgetRepository;
  final WalletRepository walletRepository;
  final CategoryRepository categoryRepository;
  final Budget? budget;

  AddBudgetBloc(this.budgetRepository, this.walletRepository,
      this.categoryRepository, @factoryParam this.budget)
      : super(AddBudgetState.initial(budget)) {
    on<_WalletsLoaded>((event, emit) {
      emit(state.copyWith(
          wallets: event.wallets, selectedWallet: event.wallets.firstOrNull));
    });
    on<_CategoriesLoaded>((event, emit) {
      emit(state.copyWith(
          categories: event.categories,
          selectedCategory: event.categories.firstOrNull));
    });
    on<ExecuteAdd>((event, emit) async {
      if (state.formKey.currentState?.validate() ?? false) {
        final newBudget = Budget(
          id: budget?.id ?? 0,
          name: state.nameController.text,
          amount: double.parse(state.amountController.text),
          walletId: state.selectedWallet!.id,
          categoryId: state.selectedCategory!.id,
        );
        if (budget == null) {
          await budgetRepository.insert(newBudget);
        } else {
          await budgetRepository.update(newBudget);
        }
        emit(state.copyWith(added: true));
      }
    });
    walletRepository.watch().first.then((value) => add(_WalletsLoaded(value)));
    // TODO check this
    categoryRepository.watch(type: CategoryType.expense).first.then((value) =>
        add(_CategoriesLoaded(value
            .where((element) => element.type == CategoryType.expense)
            .toList())));
  }
}

class _WalletsLoaded extends AddBudgetEvent {
  final List<Wallet> wallets;

  _WalletsLoaded(this.wallets);
}

class _CategoriesLoaded extends AddBudgetEvent {
  final List<Category> categories;

  _CategoriesLoaded(this.categories);
}
