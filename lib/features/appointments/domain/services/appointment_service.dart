import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/infrastructure/logging/logger.dart';
import 'package:medkit/features/appointments/data/repositories/appointment_repository.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';

@lazySingleton
class AppointmentService {
  final AppointmentRepository _appointmentRepository;
  final Logger _logger;

  AppointmentService(this._appointmentRepository, this._logger) {
    _logger.logFor(this);
  }

  Future<Result<Iterable<Appointment>>> getAppointments() async {
    try {
      _logger.info('Getting appointments');
      final Iterable<Appointment> appointments = await _appointmentRepository.getAppointments();
      _logger.info('Got ${appointments.length} appointments');
      return Success<Iterable<Appointment>>(appointments);
    } catch (e) {
      _logger.severe('Failed to get appointments: $e');
      return Failure<Iterable<Appointment>>(Exception(errorTextConfiguration));
    }
  }

  Future<Result<Iterable<Appointment>>> getUpcomingAppointments() async {
    final Result<Iterable<Appointment>> getAppointmentsResult = await getAppointments();

    switch (getAppointmentsResult) {
      case Success<Iterable<Appointment>>(value: final Iterable<Appointment> value):
        final Iterable<Appointment> upcomingAppointments =
            value.where((Appointment appointment) => appointment.date.isAfter(DateTime.now())).take(2);
        return Success<Iterable<Appointment>>(upcomingAppointments);

      case Failure<Iterable<Appointment>>():
        return getAppointmentsResult;
    }
  }
}
