import 'package:expense_tracker/presentation/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class BudgetTile extends StatelessWidget {
  const BudgetTile({
    super.key,
    required this.name,
    required this.current,
    required this.budget,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String name;
  final String current;
  final String budget;
  final IconData icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.titleMedium?.copyWith(fontSize: 18.0),
                    ),
                    Row(
                      children: [
                        Text(current),
                        const Spacer(),
                        Text(budget),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 150,
                          child: Container(
                            width: double.infinity,
                            height: 4,
                            color: colorScheme.primary,
                          ),
                        ),
                        Expanded(
                          flex: 500,
                          child: Container(
                            width: double.infinity,
                            height: 4,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
