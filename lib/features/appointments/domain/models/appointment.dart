import 'package:medkit/features/appointments/domain/models/appointment_category.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';

class Appointment {
  static Appointment empty = Appointment(
    title: '',
    doctor: '',
    date: DateTime.now(),
    appointmentType: AppointmentType.chat,
    appointmentCategory: AppointmentCategory.general,
  );

  final String title;
  final String doctor;
  final DateTime date;
  final AppointmentType appointmentType;
  final AppointmentCategory appointmentCategory;

  const Appointment({
    required this.title,
    required this.doctor,
    required this.date,
    required this.appointmentType,
    required this.appointmentCategory,
  });
}
