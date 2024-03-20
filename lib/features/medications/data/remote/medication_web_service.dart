import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/medicine.dart';
import 'package:medkit/features/medications/domain/models/medication_contract.dart';
import 'package:medkit/features/medications/domain/models/medication_schedule.dart';

@lazySingleton
class MedicationWebService {
  Future<Iterable<MedicationContract>> getMedications() async {
    return <MedicationContract>[
      MedicationContract(
        medicine: Medicine.paracetamol,
        alarmTime: const Duration(hours: 9),
        schedule: MedicationSchedule.beforeMeal,
        until: DateTime.now().add(const Duration(days: 30)),
      ),
      MedicationContract(
        medicine: Medicine.vitaminC,
        alarmTime: const Duration(hours: 9),
        schedule: MedicationSchedule.beforeMeal,
        until: DateTime.now().add(const Duration(days: 30)),
      ),
      MedicationContract(
        medicine: Medicine.vitaminD,
        alarmTime: const Duration(hours: 9),
        schedule: MedicationSchedule.beforeMeal,
        until: DateTime.now().add(const Duration(days: 30)),
      ),
    ];
  }
}
