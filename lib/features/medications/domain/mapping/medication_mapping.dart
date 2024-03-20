import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/features/medications/domain/mapping/medication_mapping.auto_mappr.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/domain/models/medication_contract.dart';

@AutoMappr(<MapType<Object, Object>>[
  MapType<MedicationContract, Medication>(),
])
@lazySingleton
class MedicationMapper extends $MedicationMapper {
  T mapObject<S, T>(S? object) => convert(object);

  Iterable<T> mapObjects<S, T>(Iterable<S> objects) => convertIterable(objects);
}
