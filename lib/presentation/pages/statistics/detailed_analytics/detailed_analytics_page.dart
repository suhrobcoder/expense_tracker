import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/statistics/category_tile.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DetailedAnalyticsPage extends StatelessWidget {
  const DetailedAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CustomBackButton(onTap: () {}),
                const SizedBox(height: 16),
                Text(
                  "Detailed analytics",
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2 * defaultPadding),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                      value: 10,
                                      color: red,
                                      showTitle: false,
                                      radius: 32),
                                  PieChartSectionData(
                                      value: 20,
                                      color: green,
                                      showTitle: false,
                                      radius: 32),
                                  PieChartSectionData(
                                      value: 15,
                                      color: yellow,
                                      showTitle: false,
                                      radius: 32),
                                  PieChartSectionData(
                                      value: 25,
                                      color: blue,
                                      showTitle: false,
                                      radius: 32),
                                  PieChartSectionData(
                                      value: 5,
                                      color: purple,
                                      showTitle: false,
                                      radius: 32),
                                  PieChartSectionData(
                                      value: 30,
                                      color: orange,
                                      showTitle: false,
                                      radius: 32),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Total spending",
                                  style: textTheme.labelMedium,
                                ),
                                Text(
                                  "\$1250",
                                  style: textTheme.headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "August 2022",
                                  style: textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            10,
                            (index) => Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.circle, color: green, size: 16),
                                  Text("Products"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Transaction history",
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: CategoryTile(
                      name: "Food",
                      transactionCount: 24,
                      amount: "\$400",
                      icon: Icons.circle,
                      color: red,
                      percentage: "20%",
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
