import 'package:medkit/features/appointments/domain/models/appointment_category.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';

class AppointmentContract {
  final String title;
  final String doctor;
  final DateTime date;
  final AppointmentType appointmentType;
  final AppointmentCategory appointmentCategory;

  AppointmentContract({
    required this.title,
    required this.doctor,
    required this.date,
    required this.appointmentType,
    required this.appointmentCategory,
  });
}
