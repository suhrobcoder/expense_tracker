part of 'add_transaction_bloc.dart';

class AddTransactionState extends Equatable {
  const AddTransactionState({
    required this.formKey,
    required this.type,
    required this.nameController,
    required this.amountController,
    required this.wallets,
    required this.selectedWallet,
    required this.categories,
    required this.selectedCategory,
    required this.added,
  });

  final GlobalKey<FormState> formKey;
  final CategoryType type;
  final TextEditingController nameController;
  final TextEditingController amountController;
  final List<Wallet> wallets;
  final Wallet? selectedWallet;
  final List<Category> categories;
  final Category? selectedCategory;
  final bool added;

  factory AddTransactionState.initial() {
    return AddTransactionState(
      formKey: GlobalKey<FormState>(),
      type: CategoryType.values.first,
      nameController: TextEditingController(),
      amountController: TextEditingController(),
      wallets: const [],
      selectedWallet: null,
      categories: const [],
      selectedCategory: null,
      added: false,
    );
  }

  AddTransactionState copyWith({
    CategoryType? type,
    List<Wallet>? wallets,
    Wallet? selectedWallet,
    List<Category>? categories,
    Category? selectedCategory,
    bool? added,
  }) {
    return AddTransactionState(
      formKey: formKey,
      type: type ?? this.type,
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
      [type, wallets, selectedWallet, categories, selectedCategory, added];
}
