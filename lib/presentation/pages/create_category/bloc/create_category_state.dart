part of 'create_category_bloc.dart';

class CreateCategoryState extends Equatable {
  const CreateCategoryState({
    required this.formKey,
    required this.nameController,
    required this.selectedType,
    required this.iconPath,
    required this.color,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final CategoryType selectedType;
  final String iconPath;
  final Color color;

  factory CreateCategoryState.initial(Category? category) {
    return CreateCategoryState(
      formKey: GlobalKey<FormState>(),
      nameController: TextEditingController(text: category?.name),
      selectedType: CategoryType.values.first,
      iconPath: icons.first,
      color: categoryColors.first,
    );
  }

  CreateCategoryState copyWith({
    CategoryType? selectedType,
    String? iconPath,
    Color? color,
  }) {
    return CreateCategoryState(
      formKey: formKey,
      nameController: nameController,
      selectedType: selectedType ?? this.selectedType,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [selectedType, iconPath, color];
}
