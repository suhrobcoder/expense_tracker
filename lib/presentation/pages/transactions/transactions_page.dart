import 'package:expense_tracker/core/map_extensions.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/transactions.dart';
import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/components/transaction_tile.dart';
import 'package:expense_tracker/presentation/components/enum_extensions.dart';
import 'package:expense_tracker/presentation/pages/transactions/bloc/transactions_bloc.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return BlocProvider(
      create: (context) => getIt<TransactionsBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: BlocBuilder<TransactionsBloc, TransactionsState>(
              builder: (context, state) {
                final transactions = state.transactions.expand();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const CustomBackButton(),
                    const SizedBox(height: 16),
                    Text(
                      "Transactions",
                      style: textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    ToggleButtons(
                      isSelected: [
                        state.type == null,
                        ...CategoryType.values
                            .map((type) => type == state.type)
                            .toList()
                      ],
                      onPressed: (index) => context
                          .read<TransactionsBloc>()
                          .add(SelectType(index == 0
                              ? null
                              : CategoryType.values[index - 1])),
                      children: [
                        SizedBox(
                          width: availableWidth / 7,
                          child: const Text(
                            "All",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: availableWidth / 3.5,
                          child: const Text(
                            "Expenses",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: availableWidth / 3.5,
                          child: const Text(
                            "Incomes",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: availableWidth / 3.5,
                          child: const Text(
                            "Savings",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final element = transactions[index];
                          if (element is String) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 8.0),
                              child: Text(
                                element,
                                style: textTheme.bodyLarge,
                              ),
                            );
                          } else if (element is Transaction) {
                            return TransactionTile(
                              title: element.name,
                              category: element.categoryId.toString(),
                              amount: element.amount.toString(),
                              icon: element.category!.icon,
                              color: Color(element.category!.color),
                              onTap: () {},
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
