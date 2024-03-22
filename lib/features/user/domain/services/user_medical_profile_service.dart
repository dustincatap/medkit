import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/features/user/data/repositories/user_medical_profile_repository.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile.dart';

@lazySingleton
class UserMedicalProfileService {
  final UserMedicalProfileRepository _userMedicalProfileRepository;

  UserMedicalProfileService(this._userMedicalProfileRepository);

  Future<Result<UserMedicalProfile>> getUserMedicalProfile() async {
    try {
      final UserMedicalProfile profile = await _userMedicalProfileRepository.getUserMedicalProfile();
      return Success<UserMedicalProfile>(profile);
    } catch (e) {
      return Failure<UserMedicalProfile>(Exception(e));
    }
  }
}
