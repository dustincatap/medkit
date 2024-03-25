import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get monthDay => DateFormat('MMM d').format(this);

  String get shortDay => DateFormat('E').format(this);
}
