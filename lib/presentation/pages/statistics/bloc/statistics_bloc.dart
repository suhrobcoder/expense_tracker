import 'package:collection/collection.dart';
import 'package:expense_tracker/core/list_extensions.dart';
import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/domain/repository/statistics_repository.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

@injectable
class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticsRepository statisticsRepository;

  final bool isBarChart;

  StatisticsBloc(this.statisticsRepository, @factoryParam this.isBarChart)
      : super(StatisticsState.initial()) {
    on<LoadStatistics>((event, emit) async {
      final stats = await statisticsRepository.getStatistics();
      final barGroups = stats
          .mapIndexed(
            (index, stat) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: stat.income,
                  width: 16,
                  color: green.withOpacity(0.5),
                ),
                BarChartRodData(
                  toY: stat.expense,
                  width: 16,
                  color: red.withOpacity(0.5),
                ),
              ],
            ),
          )
          .toList();
      final bottomTitles = stats.map((e) => e.date).toList();
      emit(state.copyWith(barGroups: barGroups, bottomTitles: bottomTitles));
    });
    on<LoadCategories>((event, emit) async {
      final categories = await statisticsRepository
          .getCategoriesWithTransactionCount(type: state.type);
      emit(state.copyWith(
          categories: categories,
          fullAmount: categories.sumOf((it) => it.amount)));
    });
    on<SelectType>((event, emit) {
      emit(state.copyWith(type: event.type));
      add(LoadCategories());
    });
    if (isBarChart) {
      add(LoadStatistics());
    }
    add(LoadCategories());
  }
}
