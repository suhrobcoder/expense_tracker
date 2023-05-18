part of 'statistics_bloc.dart';

class StatisticsState extends Equatable {
  const StatisticsState({
    this.barGroups = const [],
    this.bottomTitles = const [],
    this.categories = const [],
    this.type = CategoryType.expense,
    this.fullAmount = 0.0,
  });

  final List<BarChartGroupData> barGroups;
  final List<String> bottomTitles;
  final List<Category> categories;
  final CategoryType type;
  final double fullAmount;

  factory StatisticsState.initial() {
    return const StatisticsState();
  }

  StatisticsState copyWith({
    List<BarChartGroupData>? barGroups,
    List<String>? bottomTitles,
    List<Category>? categories,
    CategoryType? type,
    double? fullAmount,
  }) {
    return StatisticsState(
      barGroups: barGroups ?? this.barGroups,
      bottomTitles: bottomTitles ?? this.bottomTitles,
      categories: categories ?? this.categories,
      type: type ?? this.type,
      fullAmount: fullAmount ?? this.fullAmount,
    );
  }

  @override
  List<Object?> get props =>
      [barGroups, bottomTitles, categories, type, fullAmount];
}
