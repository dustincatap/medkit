import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/domain/models/result.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/navigation/navigation_service.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/services/user_profile_service.dart';

@injectable
class UserProfileAppBarViewModel implements Initializable {
  final NavigationService _navigationService;
  final UserProfileService _userProfileService;

  UserProfileAppBarViewModel(this._navigationService, this._userProfileService);

  ValueListenable<UserProfile> get userProfile => _userProfile;
  final ValueNotifier<UserProfile> _userProfile = ValueNotifier<UserProfile>(UserProfile.empty);

  @override
  Future<void> onInitialize() async {
    await _onGetUserProfile();
  }

  Future<void> onNavigateToUserProfile() async {
    await _navigationService.push(const UserProfileViewRoute());
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
}
