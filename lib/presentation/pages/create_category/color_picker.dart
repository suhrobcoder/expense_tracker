import 'package:expense_tracker/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker(
      {super.key, required this.pickedColor, required this.onPickColor});

  final Color pickedColor;
  final void Function(Color) onPickColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categoryColors
          .map((color) => ColorItem(
                color: color,
                selected: color == pickedColor,
                onTap: () => onPickColor(color),
              ))
          .toList(),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selected ? color : Colors.transparent, width: 2)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),
      ),
    );
  }
}
