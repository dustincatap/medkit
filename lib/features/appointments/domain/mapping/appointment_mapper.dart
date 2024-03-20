import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/features/appointments/domain/mapping/appointment_mapper.auto_mappr.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/domain/models/appointment_contract.dart';

@AutoMappr(<MapType<Object, Object>>[
  MapType<AppointmentContract, Appointment>(),
])
@lazySingleton
class AppointmentMapper extends $AppointmentMapper {
  T mapObject<S, T>(S? object) => convert(object);

  Iterable<T> mapObjects<S, T>(Iterable<S> objects) => convertIterable(objects);
}
