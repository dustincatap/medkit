import 'package:flutter/material.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';

class MedKitText extends StatelessWidget {
  final double? fontSize;

  const MedKitText({this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          context.il8n.landingMed,
          style: context.theme.textTheme.displayMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: context.theme.colorScheme.primary,
          ),
        ),
        Text(
          context.il8n.landingKit,
          style: context.theme.textTheme.displayMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
