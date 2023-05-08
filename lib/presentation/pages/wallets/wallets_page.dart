import 'package:expense_tracker/di/init_get_it.dart';
import 'package:expense_tracker/domain/entity/wallet_type.dart';
import 'package:expense_tracker/presentation/pages/wallets/add_wallet/add_wallet_page.dart';
import 'package:expense_tracker/presentation/pages/wallets/bloc/wallets_bloc.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:expense_tracker/presentation/components/enum_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletsPage extends StatelessWidget {
  const WalletsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => getIt<WalletsBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: BlocBuilder<WalletsBloc, WalletsState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        "Total balance",
                        style: textTheme.titleMedium,
                      ),
                      Text(
                        state.totalBalance.toString(),
                        style: textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "My wallets",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8.0),
                      ...state.wallets.map(
                        (wallet) => ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddWalletPage(wallet: wallet)),
                          ),
                          leading: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: green,
                            ),
                            child: SvgPicture.asset(
                              wallet.type.getIcon(),
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              width: 32,
                              height: 32,
                            ),
                          ),
                          title: Text(wallet.name),
                          subtitle: Text(wallet.currentBalance.toString()),
                          trailing: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 32),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Add new wallet",
                        style: textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: AddWalletCard(
                              title: "Add a bank account",
                              icon: WalletType.bankAccount.getIcon(),
                              color: WalletType.bankAccount.getColor(),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddWalletPage()),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: AddWalletCard(
                              title: "Create new wallet",
                              icon: WalletType.cash.getIcon(),
                              color: WalletType.cash.getColor(),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddWalletPage()),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: AddWalletCard(
                              title: "Create an E-Wallet",
                              icon: WalletType.eWallet.getIcon(),
                              color: WalletType.eWallet.getColor(),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddWalletPage()),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: AddWalletCard(
                              title: "Add a crypto wallet",
                              icon: WalletType.crypto.getIcon(),
                              color: WalletType.crypto.getColor(),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddWalletPage()),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddWalletCard extends StatelessWidget {
  const AddWalletCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(width: 1.0, color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: color,
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              title,
              style: textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
