import 'package:injectable/injectable.dart';
import 'package:medkit/features/appointments/domain/models/appointment_category.dart';
import 'package:medkit/features/appointments/domain/models/appointment_contract.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';

@lazySingleton
class AppointmentWebService {
  Future<Iterable<AppointmentContract>> getAppointments() async {
    return <AppointmentContract>[
      AppointmentContract(
        title: 'General check-up',
        doctor: 'Dr. Phil',
        date: DateTime.now().add(const Duration(days: 30)),
        appointmentType: AppointmentType.video,
        appointmentCategory: AppointmentCategory.general,
      ),
      AppointmentContract(
        title: 'Cardiologist check-up',
        doctor: 'Dr. Marla',
        date: DateTime.now().add(const Duration(days: 48)),
        appointmentType: AppointmentType.chat,
        appointmentCategory: AppointmentCategory.cardiology,
      ),
    ];
  }
}
