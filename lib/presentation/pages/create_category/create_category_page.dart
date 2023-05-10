import 'package:expense_tracker/core/list_extensions.dart';
import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/components/icons.dart';
import 'package:expense_tracker/presentation/components/validators.dart';
import 'package:expense_tracker/presentation/pages/create_category/bloc/create_category_bloc.dart';
import 'package:expense_tracker/presentation/pages/create_category/color_picker.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return BlocProvider(
      create: (context) => getIt<CreateCategoryBloc>(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child:
                        BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
                      listener: (context, state) {
                        if (state.added) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: state.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const CustomBackButton(),
                              const SizedBox(height: 16),
                              Text(
                                "Create category",
                                style: textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 16),
                              ToggleButtons(
                                isSelected: CategoryType.values
                                    .map((type) => type == state.selectedType)
                                    .toList(),
                                onPressed: (index) => context
                                    .read<CreateCategoryBloc>()
                                    .add(
                                        SelectType(CategoryType.values[index])),
                                children: [
                                  SizedBox(
                                    width: availableWidth / 3,
                                    child: const Text(
                                      "Expenses",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: availableWidth / 3,
                                    child: const Text(
                                      "Incomes",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: availableWidth / 3,
                                    child: const Text(
                                      "Savings",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Name",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: state.nameController,
                                validator: nonEmptyValidator,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Choose icon",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                    bottom: defaultPadding),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(2 * defaultPadding),
                                  color: Colors.black.withOpacity(0.05),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: icons
                                      .chunked(4)
                                      .map(
                                        (chunk) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: chunk
                                              .map(
                                                (icon) => IconSelectionItem(
                                                  icon: icon,
                                                  selected:
                                                      state.iconPath == icon,
                                                  onTap: () => context
                                                      .read<
                                                          CreateCategoryBloc>()
                                                      .add(SelectIcon(icon)),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Choose color",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              ColorPicker(
                                pickedColor: state.color,
                                onPickColor: (color) => context
                                    .read<CreateCategoryBloc>()
                                    .add(SelectColor(color)),
                              ),
                              const SizedBox(height: 96),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              return Positioned(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding,
                child: FilledButton(
                  onPressed: () =>
                      context.read<CreateCategoryBloc>().add(ExecuteCreate()),
                  child: const Text("CREATE CATEGORY"),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class IconSelectionItem extends StatelessWidget {
  const IconSelectionItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        margin: const EdgeInsets.only(top: defaultPadding),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          color: selected ? Colors.white : Colors.black.withOpacity(0.05),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}
