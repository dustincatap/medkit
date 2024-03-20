import 'package:medkit/common/enums/medicine.dart';
import 'package:medkit/features/medications/domain/models/medication_schedule.dart';

class MedicationContract {
  final Medicine medicine;
  final Duration alarmTime;
  final MedicationSchedule schedule;
  final DateTime until;

  const MedicationContract({
    required this.medicine,
    required this.alarmTime,
    required this.schedule,
    required this.until,
  });
}
