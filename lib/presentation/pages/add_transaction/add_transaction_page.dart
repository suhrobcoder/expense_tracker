import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/add_transaction/non_scrollable_gridview.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

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
                        "Add transaction",
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      ToggleButtons(
                        isSelected: const [true, false, false],
                        onPressed: (index) {},
                        children: [
                          SizedBox(
                            width: availableWidth / 3,
                            child: const Text(
                              "Expenses",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: availableWidth / 3,
                            child: const Text(
                              "Incomes",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: availableWidth / 3,
                            child: const Text(
                              "Savings",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Name",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(),
                      const SizedBox(height: 16),
                      Text(
                        "Amount",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(
                        decoration: InputDecoration(
                          suffix: Text("USD"),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Wallet",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 72,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              width: 128,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding),
                                color: Colors.black.withOpacity(0.05),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.wallet, size: 32),
                                  Text("Paypal"),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Expense categories",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(2 * defaultPadding),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                        ),
                        child: NonScrollableGridview(
                          crossAxisCount: 4,
                          verticalSpacing: 8.0,
                          children: [
                            AddCategoryButton(onTap: () {}),
                            ...List.generate(
                              15,
                              (index) => CategoryItem(
                                name: "Food",
                                icon: Icons.circle,
                                color: green,
                                onTap: () {},
                              ),
                            )
                          ],
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
              onPressed: () {},
              child: const Text("ADD TRANSACTION"),
            ),
          ),
        ],
      ),
    );
  }
}

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(width: 2.0),
            ),
            child: const Icon(
              Icons.add_rounded,
              size: 32.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text("Add", style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String name;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: color.withOpacity(0.2)),
            child: Icon(
              icon,
              color: color,
              size: 32.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
