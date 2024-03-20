import 'package:injectable/injectable.dart';
import 'package:medkit/features/appointments/data/remote/appointment_web_service.dart';
import 'package:medkit/features/appointments/domain/mapping/appointment_mapper.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/domain/models/appointment_contract.dart';

@lazySingleton
class AppointmentRepository {
  final AppointmentWebService _appointmentWebService;
  final AppointmentMapper _appointmentMapper;

  AppointmentRepository(this._appointmentWebService, this._appointmentMapper);

  Future<Iterable<Appointment>> getAppointments() async {
    final Iterable<AppointmentContract> contracts = await _appointmentWebService.getAppointments();
    final Iterable<Appointment> appointments =
        _appointmentMapper.mapObjects<AppointmentContract, Appointment>(contracts);

    return appointments;
  }
}
