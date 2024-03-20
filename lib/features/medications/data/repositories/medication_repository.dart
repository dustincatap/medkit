import 'package:injectable/injectable.dart';
import 'package:medkit/features/medications/data/remote/medication_web_service.dart';
import 'package:medkit/features/medications/domain/mapping/medication_mapping.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/domain/models/medication_contract.dart';

@lazySingleton
class MedicationRepository {
  final MedicationWebService _medicationWebService;
  final MedicationMapper _medicationMapper;

  MedicationRepository(this._medicationWebService, this._medicationMapper);

  Future<Iterable<Medication>> getMedications() async {
    final Iterable<MedicationContract> contracts = await _medicationWebService.getMedications();
    final Iterable<Medication> medications = _medicationMapper.mapObjects<MedicationContract, Medication>(contracts);

    return medications;
  }
}
