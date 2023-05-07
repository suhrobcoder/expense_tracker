part of 'add_wallet_bloc.dart';

class AddWalletState extends Equatable {
  const AddWalletState({
    required this.formState,
    required this.nameController,
    required this.selectedType,
    required this.selectedCurrency,
    required this.initialBalanceController,
    required this.added,
  });

  final GlobalKey<FormState> formState;
  final TextEditingController nameController;
  final WalletType selectedType;
  final String selectedCurrency;
  final TextEditingController initialBalanceController;
  final bool added;

  factory AddWalletState.initial(Wallet? wallet) {
    return AddWalletState(
      formState: GlobalKey<FormState>(),
      nameController: TextEditingController(text: wallet?.name),
      selectedType: wallet?.type ?? WalletType.values.first,
      selectedCurrency: wallet?.currency ?? currencies.first,
      initialBalanceController:
          TextEditingController(text: wallet?.initialBalance.toString()),
      added: false,
    );
  }

  AddWalletState copyWith({
    WalletType? selectedType,
    String? selectedCurrency,
    bool? added,
  }) {
    return AddWalletState(
      formState: formState,
      nameController: nameController,
      selectedType: selectedType ?? this.selectedType,
      selectedCurrency: selectedCurrency ?? this.selectedCurrency,
      initialBalanceController: initialBalanceController,
      added: added ?? this.added,
    );
  }

  @override
  List<Object> get props => [selectedType, selectedCurrency, added];
}
