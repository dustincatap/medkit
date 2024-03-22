import 'package:medkit/common/enums/allergen.dart';
import 'package:medkit/common/enums/blood_type.dart';
import 'package:medkit/common/enums/height_measurement.dart';
import 'package:medkit/common/enums/weight_measurement.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact_contract.dart';

class UserMedicalProfileContract {
  final BloodType bloodType;
  final double weight;
  final WeightMeasurement weightMeasurement;
  final double height;
  final HeightMeasurement heightMeasurement;
  final Iterable<Allergen> allergies;
  final Iterable<UserEmergencyContactContract> emergencyContacts;

  const UserMedicalProfileContract({
    required this.bloodType,
    required this.weight,
    required this.weightMeasurement,
    required this.height,
    required this.heightMeasurement,
    required this.allergies,
    required this.emergencyContacts,
  });
}
