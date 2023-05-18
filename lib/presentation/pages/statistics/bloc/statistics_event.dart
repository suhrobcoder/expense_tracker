part of 'statistics_bloc.dart';

abstract class StatisticsEvent {}

class LoadStatistics extends StatisticsEvent {}

class LoadCategories extends StatisticsEvent {}

class SelectType extends StatisticsEvent {
  final CategoryType type;

  SelectType(this.type);
}
