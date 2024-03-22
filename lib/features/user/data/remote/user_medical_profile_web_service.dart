import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/allergen.dart';
import 'package:medkit/common/enums/blood_type.dart';
import 'package:medkit/common/enums/height_measurement.dart';
import 'package:medkit/common/enums/weight_measurement.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact_contract.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile_contract.dart';

@lazySingleton
class UserMedicalProfileWebService {
  Future<UserMedicalProfileContract> getUserMedicalProfile() async {
    return const UserMedicalProfileContract(
      bloodType: BloodType.aPositive,
      weight: 70,
      weightMeasurement: WeightMeasurement.kg,
      height: 180,
      heightMeasurement: HeightMeasurement.cm,
      allergies: <Allergen>[Allergen.fruit, Allergen.shellfish],
      emergencyContacts: <UserEmergencyContactContract>[
        UserEmergencyContactContract(
          name: 'Mother',
        ),
        UserEmergencyContactContract(
          name: 'Jane Doe',
        ),
      ],
    );
  }
}
