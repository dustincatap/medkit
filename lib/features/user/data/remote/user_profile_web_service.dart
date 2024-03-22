import 'package:injectable/injectable.dart';
import 'package:medkit/common/enums/gender.dart';
import 'package:medkit/features/user/domain/models/user_profile_contract.dart';

@lazySingleton
class UserProfileWebService {
  Future<UserProfileContract> getUserProfile() async {
    return UserProfileContract(
      email: 'test@test.com',
      firstName: 'John',
      profilePictureUrl: 'https://i.pravatar.cc/256?img=13',
      lastName: 'Doe',
      dateOfBirth: DateTime(1990, 1, 1),
      gender: Gender.male,
    );
  }
}
