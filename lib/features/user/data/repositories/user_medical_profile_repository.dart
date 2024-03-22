import 'package:injectable/injectable.dart';
import 'package:medkit/features/user/data/remote/user_medical_profile_web_service.dart';
import 'package:medkit/features/user/domain/mapping/user_mapper.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile_contract.dart';

@lazySingleton
class UserMedicalProfileRepository {
  final UserMedicalProfileWebService _userMedicalProfileWebService;
  final UserMapper _userMapper;

  UserMedicalProfileRepository(this._userMedicalProfileWebService, this._userMapper);

  Future<UserMedicalProfile> getUserMedicalProfile() async {
    final UserMedicalProfileContract contract = await _userMedicalProfileWebService.getUserMedicalProfile();
    final UserMedicalProfile profile = _userMapper.mapObject<UserMedicalProfileContract, UserMedicalProfile>(contract);

    return profile;
  }
}
