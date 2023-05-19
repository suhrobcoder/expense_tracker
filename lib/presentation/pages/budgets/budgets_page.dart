import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/budgets/add_budget/add_budget_page.dart';
import 'package:expense_tracker/presentation/pages/budgets/bloc/budgets_bloc.dart';
import 'package:expense_tracker/presentation/pages/budgets/budget_tile.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return BlocProvider(
      create: (context) => getIt<BudgetsBloc>(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: BlocBuilder<BudgetsBloc, BudgetsState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const CustomBackButton(),
                            const SizedBox(height: 16),
                            Text(
                              "Monthly budget",
                              style: textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: state.total.toString(),
                                    style: textTheme.displaySmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text:
                                        " in ${state.budgets.length} categories",
                                    style: textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ToggleButtons(
                              isSelected: [
                                state.type == CategoryType.expense,
                                state.type == CategoryType.saving
                              ],
                              onPressed: (index) => context
                                  .read<BudgetsBloc>()
                                  .add(SelectType(index == 0
                                      ? CategoryType.expense
                                      : CategoryType.saving)),
                              children: [
                                SizedBox(
                                  width: availableWidth / 2,
                                  child: const Text(
                                    "Expenses",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: availableWidth / 2,
                                  child: const Text(
                                    "Savings",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            ...state.budgets
                                .map(
                                  (budget) => BudgetTile(
                                    name: budget.name,
                                    current: budget.currentUse.toString(),
                                    budget: budget.amount.toString(),
                                    icon: budget.category!.icon,
                                    color: Color(budget.category!.color),
                                    onTap: () {},
                                  ),
                                )
                                .toList(),
                            const SizedBox(height: 96),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: defaultPadding,
              right: defaultPadding,
              bottom: defaultPadding,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddBudgetPage()),
                ),
                child: const Text("CREATE A NEW BUDGET"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
