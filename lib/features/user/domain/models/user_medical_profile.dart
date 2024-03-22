import 'package:medkit/common/enums/allergen.dart';
import 'package:medkit/common/enums/blood_type.dart';
import 'package:medkit/common/enums/height_measurement.dart';
import 'package:medkit/common/enums/weight_measurement.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact.dart';

class UserMedicalProfile {
  static const UserMedicalProfile empty = UserMedicalProfile(
    bloodType: BloodType.aPositive,
    weight: 0,
    weightMeasurement: WeightMeasurement.kg,
    height: 0,
    heightMeasurement: HeightMeasurement.cm,
    allergies: <Allergen>[],
    emergencyContacts: <UserEmergencyContact>[],
  );

  final BloodType bloodType;
  final double weight;
  final WeightMeasurement weightMeasurement;
  final double height;
  final HeightMeasurement heightMeasurement;
  final Iterable<Allergen> allergies;
  final Iterable<UserEmergencyContact> emergencyContacts;

  const UserMedicalProfile({
    required this.bloodType,
    required this.weight,
    required this.weightMeasurement,
    required this.height,
    required this.heightMeasurement,
    required this.allergies,
    required this.emergencyContacts,
  });

  String get weightString => '$weight ${weightMeasurement.name}';

  String get heightString => '$height ${heightMeasurement.name}';
}
