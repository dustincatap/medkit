import 'package:flutter/widgets.dart';

class SpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const SpacedColumn({
    required this.children,
    required this.spacing,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> newChildren;

    if (children.isNotEmpty) {
      newChildren = children.expand((Widget child) sync* {
        yield child;
        yield SizedBox(height: spacing);
      }).toList();

      if (newChildren.last is SizedBox) {
        newChildren.removeLast();
      }
    } else {
      newChildren = children;
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: newChildren,
    );
  }
}
