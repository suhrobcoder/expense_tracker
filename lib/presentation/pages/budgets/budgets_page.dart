import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/budgets/add_budget/add_budget_page.dart';
import 'package:expense_tracker/presentation/pages/budgets/budget_tile.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      CustomBackButton(onTap: () {}),
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
                              text: "\$2,500",
                              style: textTheme.displaySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: " in 10 categories",
                              style: textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ToggleButtons(
                        isSelected: const [true, false],
                        onPressed: (index) {},
                        children: [
                          SizedBox(
                            width: availableWidth / 2,
                            child: const Text(
                              "Savings",
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
                      ...List.generate(
                        10,
                        (index) => BudgetTile(
                          name: "Products",
                          current: "\$150",
                          budget: "\$500",
                          icon: Icons.store_rounded,
                          color: red,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 96),
                    ],
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
                MaterialPageRoute(builder: (context) => const AddBudgetPage()),
              ),
              child: const Text("CREATE A NEW BUDGET"),
            ),
          ),
        ],
      ),
    );
  }
}
