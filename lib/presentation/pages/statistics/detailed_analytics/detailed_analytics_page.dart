import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/statistics/bloc/statistics_bloc.dart';
import 'package:expense_tracker/presentation/pages/statistics/category_tile.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedAnalyticsPage extends StatelessWidget {
  const DetailedAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return BlocProvider(
      create: (context) => getIt<StatisticsBloc>(param1: false),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: BlocBuilder<StatisticsBloc, StatisticsState>(
                  builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const CustomBackButton(),
                    const SizedBox(height: 16),
                    Text(
                      "Detailed analytics",
                      style: textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    ToggleButtons(
                      isSelected: CategoryType.values
                          .map((type) => type == state.type)
                          .toList(),
                      onPressed: (index) => context
                          .read<StatisticsBloc>()
                          .add(SelectType(CategoryType.values[index])),
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
                                      sections: state.categories
                                          .map((category) =>
                                              PieChartSectionData(
                                                  value: category.amount,
                                                  color: Color(category.color),
                                                  showTitle: false,
                                                  radius: 32))
                                          .toList()),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Total spending",
                                      style: textTheme.labelMedium,
                                    ),
                                    Text(
                                      state.fullAmount.toString(),
                                      style: textTheme.headlineLarge?.copyWith(
                                          fontWeight: FontWeight.w600),
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
                              children: state.categories
                                  .map(
                                    (category) => Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1, color: Colors.black12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.circle,
                                              color: Color(category.color),
                                              size: 16),
                                          Text(category.name),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
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
                    ...state.categories
                        .map(
                          (category) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: CategoryTile(
                              name: category.name,
                              transactionCount: category.transactionCount,
                              amount: category.amount.toString(),
                              icon: category.icon,
                              color: Color(category.color),
                              percentage:
                                  "${(category.amount / state.fullAmount * 100).toInt()}%",
                              onTap: () {},
                            ),
                          ),
                        )
                        .toList(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
