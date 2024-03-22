import 'package:flutter/widgets.dart';

class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const SpacedRow({
    required this.children,
    required this.spacing,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> newChildren = children.expand((Widget child) sync* {
      yield child;
      yield SizedBox(width: spacing);
    }).toList();

    if (newChildren.last is SizedBox) {
      newChildren.removeLast();
    }

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: newChildren,
    );
  }
}
