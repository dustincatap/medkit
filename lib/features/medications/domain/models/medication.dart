import 'package:medkit/common/enums/medicine.dart';
import 'package:medkit/features/medications/domain/models/medication_schedule.dart';

class Medication {
  static Medication empty = Medication(
    medicine: Medicine.paracetamol,
    alarmTime: Duration.zero,
    schedule: MedicationSchedule.unknown,
    until: DateTime.now(),
  );

  final Medicine medicine;
  final Duration alarmTime;
  final MedicationSchedule schedule;
  final DateTime until;

  const Medication({
    required this.medicine,
    required this.alarmTime,
    required this.schedule,
    required this.until,
  });
}
