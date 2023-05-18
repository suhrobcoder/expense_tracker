import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.name,
    required this.transactionCount,
    required this.amount,
    required this.icon,
    required this.color,
    required this.percentage,
    required this.onTap,
  });

  final String name;
  final int transactionCount;
  final String amount;
  final String icon;
  final Color color;
  final String percentage;
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
              child: SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.titleMedium?.copyWith(fontSize: 20.0),
                ),
                Text(
                  "$transactionCount transactions",
                  style: textTheme.labelMedium?.copyWith(color: darkGrey),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_outward, color: red),
            SizedBox(
              width: 96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    textAlign: TextAlign.end,
                    style: textTheme.bodyLarge
                        ?.copyWith(color: red, fontWeight: FontWeight.w600),
                  ),
                  Text(percentage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
