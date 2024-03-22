import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/infrastructure/logging/logger.dart';
import 'package:medkit/features/user/data/repositories/user_profile_repository.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';

@lazySingleton
class UserProfileService {
  final UserProfileRepository _userProfileRepository;
  final Logger _logger;

  UserProfileService(this._userProfileRepository, this._logger) {
    _logger.logFor(this);
  }

  Future<Result<UserProfile>> getUserProfile() async {
    try {
      _logger.info('Getting user profile');
      final UserProfile profile = await _userProfileRepository.getUserProfile();
      _logger.info('Got user profile for ${profile.email}');
      return Success<UserProfile>(profile);
    } catch (e) {
      _logger.severe('Failed to get user profile: $e');
      return Failure<UserProfile>(Exception(e));
    }
  }
}
