import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.balance,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String balance;
  final IconData icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(defaultPadding),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          border: Border.all(color: Colors.black38),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                color: color.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                size: 32.0,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              balance,
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
