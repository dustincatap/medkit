import 'package:injectable/injectable.dart';
import 'package:medkit/features/user/data/remote/user_web_service.dart';
import 'package:medkit/features/user/domain/mapping/user_mapper.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/models/user_profile_contract.dart';

@lazySingleton
class UserRepository {
  final UserWebService _userWebService;
  final UserMapper _userMapper;

  UserRepository(this._userWebService, this._userMapper);

  Future<UserProfile> getUserProfile() async {
    final UserProfileContract contract = await _userWebService.getUserProfile();
    final UserProfile profile = _userMapper.mapObject<UserProfileContract, UserProfile>(contract);

    return profile;
  }
}
