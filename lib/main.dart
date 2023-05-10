import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/presentation/pages/add_budget/add_budget_page.dart';
import 'package:expense_tracker/presentation/pages/add_transaction/add_transaction_page.dart';
import 'package:expense_tracker/presentation/pages/budgets/budgets_page.dart';
import 'package:expense_tracker/presentation/pages/create_category/create_category_page.dart';
import 'package:expense_tracker/presentation/pages/main/main_page.dart';
import 'package:expense_tracker/presentation/pages/statistics/detailed_analytics/detailed_analytics_page.dart';
import 'package:expense_tracker/presentation/theme/app_theme.dart';
import 'package:expense_tracker/presentation/pages/wallets/wallets_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: appTheme,
      home: const CreateCategoryPage(),
    );
  }
}
