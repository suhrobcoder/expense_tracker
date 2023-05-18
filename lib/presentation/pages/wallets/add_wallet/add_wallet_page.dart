import 'package:expense_tracker/data/database/models/categories.dart';
import 'package:expense_tracker/data/database/models/wallets.dart';
import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/currency.dart';
import 'package:expense_tracker/domain/entity/wallet_type.dart';
import 'package:expense_tracker/presentation/components/back_button.dart';
import 'package:expense_tracker/presentation/components/validators.dart';
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/bloc/add_wallet_bloc.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWalletPage extends StatelessWidget {
  const AddWalletPage({
    super.key,
    this.wallet,
  });

  final Wallet? wallet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<AddWalletBloc>(param1: wallet),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: BlocConsumer<AddWalletBloc, AddWalletState>(
                    listener: (context, state) {
                      if (state.added) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: state.formState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const CustomBackButton(),
                            const SizedBox(height: 16),
                            Text(
                              "Add new wallet",
                              style: textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Wallet name",
                              style: textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: state.nameController,
                              decoration: const InputDecoration(
                                  hintText: "Wallet name"),
                              validator: nonEmptyValidator,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Type",
                                        style: textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 4),
                                      DropdownButtonFormField<WalletType>(
                                        value: state.selectedType,
                                        items: WalletType.values
                                            .map((type) => DropdownMenuItem(
                                                value: type,
                                                child: Text(type.name)))
                                            .toList(),
                                        onChanged: (value) => context
                                            .read<AddWalletBloc>()
                                            .add(WalletTypeChanged(value)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: defaultPadding),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Currency",
                                        style: textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 4),
                                      DropdownButtonFormField<String>(
                                        value: state.selectedCurrency,
                                        items: currencies
                                            .map((currency) => DropdownMenuItem(
                                                value: currency,
                                                child: Text(currency)))
                                            .toList(),
                                        onChanged: (value) => context
                                            .read<AddWalletBloc>()
                                            .add(CurrencyChanged(value)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Initial balance",
                              style: textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: state.initialBalanceController,
                              decoration: const InputDecoration(
                                  hintText: "Wallet balance"),
                              validator: nonEmptyValidator,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ],
                        ),
                      );
                    },
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
                      context.read<AddWalletBloc>().add(ExecuteAddEvent()),
                  child: Text(wallet == null ? "CREATE WALLET" : "SAVE WALLET"),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
