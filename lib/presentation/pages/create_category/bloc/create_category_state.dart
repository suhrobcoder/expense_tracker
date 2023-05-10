part of 'create_category_bloc.dart';

class CreateCategoryState extends Equatable {
  const CreateCategoryState({
    required this.formKey,
    required this.nameController,
    required this.selectedType,
    required this.iconPath,
    required this.color,
    required this.added,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final CategoryType selectedType;
  final String iconPath;
  final Color color;
  final bool added;

  factory CreateCategoryState.initial(Category? category) {
    return CreateCategoryState(
      formKey: GlobalKey<FormState>(),
      nameController: TextEditingController(text: category?.name),
      selectedType: CategoryType.values.first,
      iconPath: icons.first,
      color: categoryColors.first,
      added: false,
    );
  }

  CreateCategoryState copyWith({
    CategoryType? selectedType,
    String? iconPath,
    Color? color,
    bool? added,
  }) {
    return CreateCategoryState(
      formKey: formKey,
      nameController: nameController,
      selectedType: selectedType ?? this.selectedType,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
      added: added ?? this.added,
    );
  }

  @override
  List<Object> get props => [selectedType, iconPath, color, added];
}
