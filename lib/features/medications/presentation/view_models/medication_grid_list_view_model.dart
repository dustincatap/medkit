import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/domain/services/medication_service.dart';

@injectable
class MedicationGridListViewModel implements Initializable {
  final MedicationService _medicationService;

  MedicationGridListViewModel(this._medicationService);

  ValueListenable<Iterable<Medication>> get medications => _medications;
  final ValueNotifier<Iterable<Medication>> _medications = ValueNotifier<Iterable<Medication>>(<Medication>[]);

  @override
  Future<void> onInitialize() async {
    await _onGetMedications();
  }

  Future<void> _onGetMedications() async {
    final Result<Iterable<Medication>> getMedicationsResult = await _medicationService.getMedications();

    switch (getMedicationsResult) {
      case Success<Iterable<Medication>>(:final Iterable<Medication> value):
        _medications.value = value;

      case Failure<Iterable<Medication>>():
        break;
    }
  }
}
