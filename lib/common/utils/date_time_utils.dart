abstract class DateTimeUtils {
  static int getYearsOld(DateTime birthDate) {
    final DateTime now = DateTime.now();
    return now.year - birthDate.year;
  }
}
