import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/infrastructure/logging/logger.dart';
import 'package:medkit/features/medications/data/repositories/medication_repository.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';

@lazySingleton
class MedicationService {
  final MedicationRepository _medicationRepository;
  final Logger _logger;

  MedicationService(this._medicationRepository, this._logger) {
    _logger.logFor(this);
  }

  Future<Result<Iterable<Medication>>> getMedications() async {
    try {
      _logger.info('Getting medications');
      final Iterable<Medication> medications = await _medicationRepository.getMedications();
      _logger.info('Got ${medications.length} medications');
      return Success<Iterable<Medication>>(medications);
    } catch (e) {
      _logger.severe('Failed to get medications: $e');
      return Failure<Iterable<Medication>>(Exception(e));
    }
  }
}
