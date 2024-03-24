import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/navigation/navigation_service.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';

@injectable
class DashboardViewModel implements Initializable {
  final NavigationService _navigationService;

  DashboardViewModel(this._navigationService);

  ValueListenable<Iterable<Medication>> get medications => _medications;
  final ValueNotifier<Iterable<Medication>> _medications = ValueNotifier<Iterable<Medication>>(<Medication>[]);

  @override
  Future<void> onInitialize() async {}

  Future<void> onNavigateToAppointments() async {
    await _navigationService.push(const YourAppointmentsListViewRoute());
  }

  Future<void> onNavigateToMedications() async {
    await _navigationService.push(const MyMedicationGridListViewRoute());
  }
}
