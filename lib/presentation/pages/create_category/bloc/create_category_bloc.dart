import 'package:expense_tracker/domain/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/icons.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

@injectable
class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CategoryRepository repository;
  final Category? category;

  CreateCategoryBloc(this.repository, @factoryParam this.category)
      : super(CreateCategoryState.initial(category)) {
    on<SelectType>((event, emit) {
      emit(state.copyWith(selectedType: event.type));
    });
    on<SelectIcon>((event, emit) {
      emit(state.copyWith(iconPath: event.icon));
    });
    on<SelectColor>((event, emit) {
      emit(state.copyWith(color: event.color));
    });
    on<ExecuteCreate>((event, emit) async {
      final validated = state.formKey.currentState?.validate() ?? false;
      if (validated) {
        final newCategory = Category(
          id: category?.id ?? 0,
          name: state.nameController.text,
          icon: state.iconPath,
          color: state.color.value,
          type: state.selectedType,
        );
        if (category == null) {
          repository.insert(newCategory);
        } else {
          repository.update(newCategory);
        }
      }
    });
  }
}
