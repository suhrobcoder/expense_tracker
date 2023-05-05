import 'package:expense_tracker/presentation/pages/home/stat_card.dart';
import 'package:expense_tracker/presentation/pages/home/transaction_tile.dart';
import 'package:expense_tracker/presentation/pages/home/wallet_card.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Total balance",
                      style: textTheme.titleLarge?.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "\$2,600",
                      style: textTheme.displaySmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 128,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: defaultPadding),
                      itemBuilder: (context, index) {
                        return WalletCard(
                          title: "Monobank",
                          balance: "\$1,250",
                          icon: Icons.wallet_rounded,
                          color: green,
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
                        balance: "\$1500",
                        icon: Icons.circle,
                        color: green,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: StatCard(
                        title: "Incomes",
                        balance: "\$2600",
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
                        balance: "\$1000",
                        icon: Icons.circle,
                        color: red,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    Expanded(
                      child: StatCard(
                        title: "Savings",
                        balance: "\$800",
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
                  child: Row(
                    children: [
                      Text(
                        "See all",
                        style: textTheme.titleMedium?.copyWith(fontSize: 18.0),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: 4.0),
              child: TransactionTile(
                title: "Subway",
                category: "Transport",
                amount: "-\$9.00",
                icon: Icons.circle,
                color: green,
                onTap: () {},
              ),
            ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
