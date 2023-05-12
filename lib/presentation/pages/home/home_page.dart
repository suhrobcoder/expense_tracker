import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/presentation/components/enum_extensions.dart';
import 'package:expense_tracker/presentation/pages/home/bloc/home_bloc.dart';
import 'package:expense_tracker/presentation/pages/home/stat_card.dart';
import 'package:expense_tracker/presentation/components/transaction_tile.dart';
import 'package:expense_tracker/presentation/pages/home/wallet_card.dart';
import 'package:expense_tracker/presentation/pages/transactions/transactions_page.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 2 * defaultPadding),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(1.5 * defaultPadding),
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFA18ACB),
                      Color(0xFFEBC8FF),
                      Color(0xFFA18ACB)
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Text(
                          "Total balance",
                          style: textTheme.titleLarge?.copyWith(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Text(
                          state.totalBalance.toString(),
                          style: textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 128,
                        child: ListView.separated(
                          itemCount: state.wallets.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: defaultPadding),
                          itemBuilder: (context, index) {
                            final wallet = state.wallets[index];
                            return WalletCard(
                              title: wallet.name,
                              balance: wallet.currentBalance.toString(),
                              icon: wallet.type.getIcon(),
                              color: wallet.type.getColor(),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: "Monthly budget",
                            balance: state.budget.toString(),
                            icon: Icons.circle,
                            color: green,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: StatCard(
                            title: "Incomes",
                            balance: state.incomes.toString(),
                            icon: Icons.circle,
                            color: green,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: "Expenses",
                            balance: state.expenses.toString(),
                            icon: Icons.circle,
                            color: red,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: StatCard(
                            title: "Savings",
                            balance: state.savings.toString(),
                            icon: Icons.circle,
                            color: green,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent transactions",
                      style: textTheme.titleMedium?.copyWith(fontSize: 20.0),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransactionsPage()),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "See all",
                            style:
                                textTheme.titleMedium?.copyWith(fontSize: 18.0),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ...state.latestTransactions.map(
                (transaction) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 4.0),
                  child: TransactionTile(
                    title: transaction.name,
                    category: transaction.category!.name,
                    amount: transaction.amount.toString(),
                    icon: transaction.category!.icon,
                    color: Color(transaction.category!.color),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          );
        }),
      ),
    );
  }
}
