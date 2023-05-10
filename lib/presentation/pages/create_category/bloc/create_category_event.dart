part of 'create_category_bloc.dart';

abstract class CreateCategoryEvent {}

class SelectType extends CreateCategoryEvent {
  final CategoryType? type;

  SelectType(this.type);
}

class SelectIcon extends CreateCategoryEvent {
  final String icon;

  SelectIcon(this.icon);
}

class SelectColor extends CreateCategoryEvent {
  final Color color;

  SelectColor(this.color);
}

class ExecuteCreate extends CreateCategoryEvent {}
