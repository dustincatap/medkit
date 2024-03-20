import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get monthDay => DateFormat('MMM d').format(this);
}
