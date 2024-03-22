import 'package:injectable/injectable.dart';
import 'package:medkit/features/user/data/remote/user_profile_web_service.dart';
import 'package:medkit/features/user/domain/mapping/user_mapper.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/models/user_profile_contract.dart';

@lazySingleton
class UserProfileRepository {
  final UserProfileWebService _userProfileWebService;
  final UserMapper _userMapper;

  UserProfileRepository(this._userProfileWebService, this._userMapper);

  Future<UserProfile> getUserProfile() async {
    final UserProfileContract contract = await _userProfileWebService.getUserProfile();
    final UserProfile profile = _userMapper.mapObject<UserProfileContract, UserProfile>(contract);

    return profile;
  }
}
