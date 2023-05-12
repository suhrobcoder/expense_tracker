part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.totalBalance,
    required this.wallets,
    required this.latestTransactions,
    required this.incomes,
    required this.budget,
    required this.expenses,
    required this.savings,
  });

  final double totalBalance;
  final List<Wallet> wallets;
  final List<Transaction> latestTransactions;
  final double budget;
  final double incomes;
  final double expenses;
  final double savings;

  factory HomeState.initial() {
    return const HomeState(
      totalBalance: -1.0,
      wallets: [],
      latestTransactions: [],
      budget: -1.0,
      incomes: -1.0,
      expenses: -1.0,
      savings: -1.0,
    );
  }

  HomeState copyWith({
    double? totalBalance,
    List<Wallet>? wallets,
    List<Transaction>? latestTransactions,
    double? budget,
    double? incomes,
    double? expenses,
    double? savings,
  }) {
    return HomeState(
      totalBalance: totalBalance ?? this.totalBalance,
      wallets: wallets ?? this.wallets,
      latestTransactions: latestTransactions ?? this.latestTransactions,
      budget: budget ?? this.budget,
      incomes: incomes ?? this.incomes,
      expenses: expenses ?? this.expenses,
      savings: savings ?? this.savings,
    );
  }

  @override
  List<Object> get props => [
        totalBalance,
        wallets,
        latestTransactions,
        budget,
        incomes,
        expenses,
        savings
      ];
}
