import 'package:medkit/common/enums/allergen.dart';
import 'package:medkit/common/enums/blood_type.dart';
import 'package:medkit/common/enums/height_measurement.dart';
import 'package:medkit/common/enums/weight_measurement.dart';

class UserMedicalProfile {
  final BloodType bloodType;
  final double weight;
  final WeightMeasurement weightMeasurement;
  final double height;
  final HeightMeasurement heightMeasurement;
  final Iterable<Allergen> allergies;

  const UserMedicalProfile({
    required this.bloodType,
    required this.weight,
    required this.weightMeasurement,
    required this.height,
    required this.heightMeasurement,
    required this.allergies,
  });

  String get weightString => '$weight ${weightMeasurement.name}';

  String get heightString => '$height ${heightMeasurement.name}';
}
