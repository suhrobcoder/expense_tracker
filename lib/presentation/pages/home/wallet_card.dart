import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.title,
    required this.balance,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String balance;
  final String icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(1.5 * defaultPadding),
      child: Container(
        width: 128,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5 * defaultPadding),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                color: color,
              ),
              child: SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            Text(
              title,
              style: textTheme.labelLarge,
              maxLines: 1,
            ),
            Text(
              balance,
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
