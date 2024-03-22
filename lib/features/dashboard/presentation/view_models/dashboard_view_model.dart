import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/navigation/navigation_service.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/domain/services/appointment_service.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/domain/services/medication_service.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/services/user_profile_service.dart';

@injectable
class DashboardViewModel implements Initializable {
  final NavigationService _navigationService;
  final UserProfileService _userProfileService;
  final AppointmentService _appointmentService;
  final MedicationService _medicationService;

  DashboardViewModel(
    this._navigationService,
    this._userProfileService,
    this._appointmentService,
    this._medicationService,
  );

  ValueListenable<UserProfile> get userProfile => _userProfile;
  final ValueNotifier<UserProfile> _userProfile = ValueNotifier<UserProfile>(UserProfile.empty);

  ValueListenable<Iterable<Appointment>> get appointments => _appointments;
  final ValueNotifier<Iterable<Appointment>> _appointments = ValueNotifier<Iterable<Appointment>>(<Appointment>[]);

  ValueListenable<Iterable<Medication>> get medications => _medications;
  final ValueNotifier<Iterable<Medication>> _medications = ValueNotifier<Iterable<Medication>>(<Medication>[]);

  @override
  Future<void> onInitialize() async {
    await _onGetUserProfile();
    await _onGetAppointments();
    await _onGetMedications();
  }

  Future<void> onNavigateToUserProfile() async {
    await _navigationService.push(const UserProfileViewRoute());
  }

  Future<void> _onGetUserProfile() async {
    final Result<UserProfile> getUserProfileResult = await _userProfileService.getUserProfile();

    switch (getUserProfileResult) {
      case Success<UserProfile>(:final UserProfile value):
        _userProfile.value = value;

      case Failure<UserProfile>():
        break;
    }
  }

  Future<void> _onGetAppointments() async {
    final Result<Iterable<Appointment>> getUpcomingAppointmentsResult =
        await _appointmentService.getUpcomingAppointments();

    switch (getUpcomingAppointmentsResult) {
      case Success<Iterable<Appointment>>(:final Iterable<Appointment> value):
        _appointments.value = value;

      case Failure<Iterable<Appointment>>():
        break;
    }
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
