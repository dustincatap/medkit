import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';

@injectable
class BookYourAppointmentViewModel implements InitializableParameter<MedicalField> {
  Iterable<DateTime> get availableDates => <DateTime>[
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
        DateTime.now().add(const Duration(days: 4)),
        DateTime.now().add(const Duration(days: 5)),
      ];

  Iterable<String> get availableTimes => <String>[
        '9:00',
        '10:00',
        '11:00',
        '12:00',
        '13:00',
        '14:00',
        '15:00',
        '16:00',
      ];

  Iterable<AppointmentType> get availableAppointmentTypes => AppointmentType.values;

  ValueListenable<MedicalField> get selectedMedicalField => _selectedMedicalField;
  final ValueNotifier<MedicalField> _selectedMedicalField = ValueNotifier<MedicalField>(MedicalField.general);

  ValueListenable<AppointmentType> get selectedAppointmentType => _selectedAppointmentType;
  final ValueNotifier<AppointmentType> _selectedAppointmentType = ValueNotifier<AppointmentType>(AppointmentType.video);

  ValueListenable<DateTime> get selectedDate => _selectedDate;
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier<DateTime>(DateTime.now());

  ValueListenable<String> get selectedTime => _selectedTime;
  final ValueNotifier<String> _selectedTime = ValueNotifier<String>('9:00');

  @override
  Future<void> onInitialize(MedicalField parameter) {
    _selectedMedicalField.value = parameter;

    return Future<void>.value();
  }

  void onSelectedAppointmentTypeChanged(AppointmentType appointmentType) {
    _selectedAppointmentType.value = appointmentType;
  }

  void onSelectedDateChanged(DateTime date) {
    _selectedDate.value = date;
  }

  void onSelectedTimeChanged(String time) {
    _selectedTime.value = time;
  }
}
