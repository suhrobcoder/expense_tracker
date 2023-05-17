import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/database/models/budgets.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/components/validators.dart';
import 'package:expense_tracker/presentation/pages/budgets/add_budget/bloc/add_budget_bloc.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBudgetPage extends StatelessWidget {
  final Budget? budget;

  const AddBudgetPage({super.key, this.budget});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<AddBudgetBloc>(param1: budget),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: BlocConsumer<AddBudgetBloc, AddBudgetState>(
                      listener: (context, state) {
                        if (state.added) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: state.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const CustomBackButton(),
                              const SizedBox(height: 16),
                              Text(
                                "Add new budget",
                                style: textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Budget name",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Budget name"),
                                controller: state.nameController,
                                validator: nonEmptyValidator,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Amount",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "Amount"),
                                controller: state.amountController,
                                validator: nonEmptyValidator,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Wallets",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              DropdownButtonFormField<Wallet>(
                                decoration:
                                    const InputDecoration(hintText: "Wallet"),
                                value: state.selectedWallet,
                                items: state.wallets
                                    .map(
                                      (e) => DropdownMenuItem<Wallet>(
                                          value: e, child: Text(e.name)),
                                    )
                                    .toList(),
                                onChanged: (value) =>
                                    context.read<AddBudgetBloc>().add(
                                          SelectWallet(value),
                                        ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Budget for",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              DropdownButtonFormField<Category>(
                                decoration:
                                    const InputDecoration(hintText: "Category"),
                                value: state.selectedCategory,
                                items: state.categories
                                    .map(
                                      (e) => DropdownMenuItem<Category>(
                                        value: e,
                                        child: Text(e.name),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) => context
                                    .read<AddBudgetBloc>()
                                    .add(SelectCategory(value)),
                              ),
                              const SizedBox(height: 96),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              return Positioned(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding,
                child: FilledButton(
                  onPressed: () =>
                      context.read<AddBudgetBloc>().add(ExecuteAdd()),
                  child: const Text("ADD A BUDGET"),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
