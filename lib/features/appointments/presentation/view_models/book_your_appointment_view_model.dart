import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';

@injectable
class BookYourAppointmentViewModel implements InitializableParameter<MedicalField> {
  ValueListenable<MedicalField> get medicalField => _medicalField;
  final ValueNotifier<MedicalField> _medicalField = ValueNotifier<MedicalField>(MedicalField.general);

  @override
  Future<void> onInitialize(MedicalField parameter) {
    _medicalField.value = parameter;

    return Future<void>.value();
  }
}
