import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/presentation/pages/statistics/bloc/statistics_bloc.dart';
import 'package:expense_tracker/presentation/pages/statistics/category_tile.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => getIt<StatisticsBloc>(),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: BlocBuilder<StatisticsBloc, StatisticsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Statistics",
                      style: textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 56,
                                getTitlesWidget: (value, meta) =>
                                    Text(value > 1000000
                                        ? "${value / 1000000} M"
                                        : value > 1000
                                            ? "${value / 1000} K"
                                            : value.toString()),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 48,
                                getTitlesWidget: (value, meta) =>
                                    Text(state.bottomTitles[value.toInt()]),
                              ),
                            ),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                          ),
                          gridData: FlGridData(drawVerticalLine: false),
                          borderData: FlBorderData(show: false),
                          barGroups: state.barGroups,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(colorScheme.primary),
                            textStyle: const MaterialStatePropertyAll(TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0)),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.black)),
                        child: const Text(
                          "DETAILED ANALYTICS",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Expenses categories",
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
                    const SizedBox(height: 32),
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
