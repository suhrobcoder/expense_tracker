import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/pages/create_category/color_picker.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class CreateCategoryPage extends StatelessWidget {
  const CreateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      CustomBackButton(onTap: () {}),
                      const SizedBox(height: 16),
                      Text(
                        "Create category",
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      ToggleButtons(
                        isSelected: const [true, false, false],
                        onPressed: (index) {},
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
                      const TextField(),
                      const SizedBox(height: 16),
                      Text(
                        "Planned outlay",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      const TextField(
                        decoration: InputDecoration(
                          suffix: Text("USD per month"),
                        ),
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
                        height: 180,
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(2 * defaultPadding),
                          color: Colors.black.withOpacity(0.05),
                        ),
                        child: PageView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [1, 2]
                                  .map(
                                    (e) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        4,
                                        (index) => Container(
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                defaultPadding),
                                            color:
                                                Colors.black.withOpacity(0.05),
                                          ),
                                          child: const Icon(
                                              Icons.favorite_outline,
                                              size: 32),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Choose color",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      ColorPicker(pickedColor: green, onPickColor: (color) {}),
                      const SizedBox(height: 96),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: defaultPadding,
            right: defaultPadding,
            bottom: defaultPadding,
            child: FilledButton(
              onPressed: () {},
              child: const Text("CREATE CATEGORY"),
            ),
          ),
        ],
      ),
    );
  }
}
