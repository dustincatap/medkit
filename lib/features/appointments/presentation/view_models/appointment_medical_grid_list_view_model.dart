import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/navigation/navigation_service.dart';

@injectable
class AppointmentMedicalGridListViewModel {
  final NavigationService _navigationService;

  AppointmentMedicalGridListViewModel(this._navigationService);

  Iterable<MedicalField> get medicalFields {
    final List<MedicalField> fields = <MedicalField>[...MedicalField.values];
    fields.remove(MedicalField.unknown);
    return fields;
  }

  Future<void> onNavigateToAppointmentBooking(MedicalField medicalField) async {
    await _navigationService.push(BookYourAppointmentViewRoute(initialMedicalField: medicalField));
  }
}
