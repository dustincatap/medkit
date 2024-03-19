import 'package:flutter/material.dart';
import 'package:medkit/common/localization/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  Il8n get il8n => Il8n.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}
