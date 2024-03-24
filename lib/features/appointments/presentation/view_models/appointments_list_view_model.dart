import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/domain/services/appointment_service.dart';

@injectable
class AppointmentsListViewModel implements Initializable {
  final AppointmentService _appointmentService;

  AppointmentsListViewModel(this._appointmentService);

  ValueListenable<Iterable<Appointment>> get appointments => _appointments;
  final ValueNotifier<Iterable<Appointment>> _appointments = ValueNotifier<Iterable<Appointment>>(<Appointment>[]);

  @override
  Future<void> onInitialize() async {
    await _onGetAppointments();
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
}
