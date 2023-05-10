import 'package:flutter/material.dart';

class NonScrollableGridview extends StatelessWidget {
  const NonScrollableGridview({
    super.key,
    required this.crossAxisCount,
    required this.children,
    required this.verticalSpacing,
  });

  final int crossAxisCount;
  final double verticalSpacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    int rowCount = (children.length - 1) ~/ crossAxisCount + 1;
    return Column(
      children: List.generate(
        rowCount,
        (i) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(crossAxisCount, (j) {
            final index = i * crossAxisCount + j;
            if (index >= children.length) {
              return const SizedBox(width: 48.0);
            }
            return Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : verticalSpacing),
                child: children[index]);
          }),
        ),
      ),
    );
  }
}
