import 'package:expense_tracker/presentation/pages/wallets/add_wallet/add_wallet_page.dart';
import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class WalletsPage extends StatelessWidget {
  const WalletsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Total balance",
                  style: textTheme.titleMedium,
                ),
                Text(
                  "\$2,600",
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
                ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddWalletPage()),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: green,
                    ),
                    child: const Icon(
                      Icons.circle,
                      size: 32,
                    ),
                  ),
                  title: const Text("Monobank account"),
                  subtitle: const Text("\$1,000"),
                  trailing:
                      const Icon(Icons.keyboard_arrow_right_rounded, size: 32),
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: green,
                    ),
                    child: const Icon(
                      Icons.circle,
                      size: 32,
                    ),
                  ),
                  title: const Text("Monobank account"),
                  subtitle: const Text("\$1,000"),
                  trailing:
                      const Icon(Icons.keyboard_arrow_right_rounded, size: 32),
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  onTap: () {},
                  leading: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: green,
                    ),
                    child: const Icon(
                      Icons.circle,
                      size: 32,
                    ),
                  ),
                  title: const Text("Monobank account"),
                  subtitle: const Text("\$1,000"),
                  trailing:
                      const Icon(Icons.keyboard_arrow_right_rounded, size: 32),
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
                        icon: Icons.circle,
                        color: green,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: AddWalletCard(
                        title: "Create new wallet",
                        icon: Icons.circle,
                        color: green,
                        onTap: () {},
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
                        icon: Icons.circle,
                        color: green,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: AddWalletCard(
                        title: "Add a crypto wallet",
                        icon: Icons.circle,
                        color: green,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
              ],
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
  final IconData icon;
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
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: color,
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
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
