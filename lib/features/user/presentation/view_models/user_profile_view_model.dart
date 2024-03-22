import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/allergen.dart';
import 'package:medkit/common/enums/blood_type.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/services/user_medical_profile_service.dart';
import 'package:medkit/features/user/domain/services/user_profile_service.dart';
import 'package:medkit/features/user/presentation/models/medical_data_item.dart';

@lazySingleton
class UserProfileViewModel implements Initializable {
  final UserProfileService _userProfileService;
  final UserMedicalProfileService _userMedicalProfileService;

  UserProfileViewModel(this._userProfileService, this._userMedicalProfileService);

  ValueListenable<UserProfile> get userProfile => _userProfile;
  final ValueNotifier<UserProfile> _userProfile = ValueNotifier<UserProfile>(UserProfile.empty);

  ValueListenable<UserMedicalProfile> get userMedicalProfile => _userMedicalProfile;
  final ValueNotifier<UserMedicalProfile> _userMedicalProfile =
      ValueNotifier<UserMedicalProfile>(UserMedicalProfile.empty);

  ValueListenable<Iterable<MedicalDataItem>> get medicalDataItems => _medicalDataItems;
  final ValueNotifier<Iterable<MedicalDataItem>> _medicalDataItems =
      ValueNotifier<Iterable<MedicalDataItem>>(<MedicalDataItem>[]);

  ValueListenable<Iterable<UserEmergencyContact>> get emergencyContacts => _emergencyContacts;
  final ValueNotifier<Iterable<UserEmergencyContact>> _emergencyContacts =
      ValueNotifier<Iterable<UserEmergencyContact>>(<UserEmergencyContact>[]);

  @override
  Future<void> onInitialize() async {
    await _onGetUserProfile();
    await _onGetUserMedicalProfile();
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

  Future<void> _onGetUserMedicalProfile() async {
    final Result<UserMedicalProfile> getUserMedicalProfileResult =
        await _userMedicalProfileService.getUserMedicalProfile();

    switch (getUserMedicalProfileResult) {
      case Success<UserMedicalProfile>(:final UserMedicalProfile value):
        _userMedicalProfile.value = value;
        _emergencyContacts.value = value.emergencyContacts;

        final List<MedicalDataItem> medicalDataItems = <MedicalDataItem>[];
        medicalDataItems.add(MedicalDataItem('Blood Type', value.bloodType.localizedName));
        medicalDataItems.add(MedicalDataItem('Height', value.weightString));
        medicalDataItems.add(MedicalDataItem('Weight', value.heightString));
        medicalDataItems
            .add(MedicalDataItem('Allergies', value.allergies.map((Allergen e) => e.localizedName).join(', ')));
        _medicalDataItems.value = medicalDataItems;

      case Failure<UserMedicalProfile>():
        break;
    }
  }
}
