import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

// TODO dropdown menus
class AddBudgetPage extends StatelessWidget {
  const AddBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                      const TextField(
                        decoration: InputDecoration(hintText: "Budget name"),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Amount",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(
                        decoration: InputDecoration(hintText: "Amount"),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Wallets",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(
                        decoration: InputDecoration(hintText: "All wallets"),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Budget for",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(
                        decoration: InputDecoration(hintText: "All expenses"),
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
              onPressed: () {},
              child: const Text("ADD A BUDGET"),
            ),
          ),
        ],
      ),
    );
  }
}
