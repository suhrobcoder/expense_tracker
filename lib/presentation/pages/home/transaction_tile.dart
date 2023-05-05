import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.title,
    required this.category,
    required this.amount,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String category;
  final String amount;
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
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPadding),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding * 0.7),
                color: color.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                size: 32.0,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(fontSize: 20.0),
                ),
                Text(
                  category,
                  style: textTheme.labelLarge,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_outward, color: red),
            SizedBox(
              width: 96,
              child: Text(
                amount,
                textAlign: TextAlign.end,
                style: textTheme.bodyLarge
                    ?.copyWith(color: red, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
