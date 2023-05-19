import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/category_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/components/enum_extensions.dart';
import 'package:expense_tracker/presentation/components/validators.dart';
import 'package:expense_tracker/presentation/pages/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:expense_tracker/presentation/pages/add_transaction/non_scrollable_gridview.dart';
import 'package:expense_tracker/presentation/pages/create_category/create_category_page.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final availableWidth = size.width - 2 * defaultPadding;
    return BlocProvider(
      create: (context) => getIt<AddTransactionBloc>(),
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
                        BlocConsumer<AddTransactionBloc, AddTransactionState>(
                      listenWhen: (previous, current) =>
                          previous.added != current.added,
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
                                "Add transaction",
                                style: textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 16),
                              ToggleButtons(
                                isSelected: CategoryType.values
                                    .map((type) => type == state.type)
                                    .toList(),
                                onPressed: (index) => context
                                    .read<AddTransactionBloc>()
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
                                "Amount",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: state.amountController,
                                validator: nonEmptyValidator,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Wallet",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                height: 72,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.wallets.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 8),
                                  itemBuilder: (context, index) {
                                    final wallet = state.wallets[index];
                                    final selected =
                                        wallet == state.selectedWallet;
                                    return Container(
                                      padding: const EdgeInsets.all(
                                          defaultPadding / 2),
                                      width: 128,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            defaultPadding),
                                        color: selected
                                            ? colorScheme.primary
                                            : Colors.black.withOpacity(0.05),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            wallet.type.getIcon(),
                                            width: 32,
                                            height: 32,
                                          ),
                                          Text(wallet.name),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Expense categories",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(2 * defaultPadding),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.2)),
                                ),
                                child: NonScrollableGridview(
                                  crossAxisCount: 4,
                                  verticalSpacing: 8.0,
                                  children: [
                                    AddCategoryButton(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreateCategoryPage()),
                                      ),
                                    ),
                                    ...state.categories
                                        .map(
                                          (category) => CategoryItem(
                                            name: category.name,
                                            icon: category.icon,
                                            color: Color(category.color),
                                            selected: category ==
                                                state.selectedCategory,
                                            onTap: () => context
                                                .read<AddTransactionBloc>()
                                                .add(SelectCategory(category)),
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
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
                      context.read<AddTransactionBloc>().add(ExecuteAdd()),
                  child: const Text("ADD TRANSACTION"),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(width: 2.0),
            ),
            child: const Icon(
              Icons.add_rounded,
              size: 32.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text("Add", style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                    color: selected ? color : Colors.transparent, width: 2.0),
                color: color.withOpacity(0.2)),
            child: SvgPicture.asset(
              icon,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
