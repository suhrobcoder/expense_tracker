part of 'add_budget_bloc.dart';

class AddBudgetState extends Equatable {
  const AddBudgetState({
    required this.formKey,
    required this.nameController,
    required this.amountController,
    required this.wallets,
    required this.selectedWallet,
    required this.categories,
    required this.selectedCategory,
    required this.added,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController amountController;
  final List<Wallet> wallets;
  final Wallet? selectedWallet;
  final List<Category> categories;
  final Category? selectedCategory;
  final bool added;

  factory AddBudgetState.initial(Budget? budget) {
    return AddBudgetState(
      formKey: GlobalKey(),
      nameController: TextEditingController(text: budget?.name),
      amountController: TextEditingController(text: budget?.amount.toString()),
      wallets: const [],
      selectedWallet: null,
      categories: const [],
      selectedCategory: null,
      added: false,
    );
  }

  AddBudgetState copyWith({
    List<Wallet>? wallets,
    Wallet? selectedWallet,
    List<Category>? categories,
    Category? selectedCategory,
    bool? added,
  }) {
    return AddBudgetState(
      formKey: formKey,
      nameController: nameController,
      amountController: amountController,
      wallets: wallets ?? this.wallets,
      selectedWallet: selectedWallet ?? this.selectedWallet,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      added: added ?? this.added,
    );
  }

  @override
  List<Object?> get props =>
      [wallets, selectedWallet, categories, selectedCategory, added];
}
