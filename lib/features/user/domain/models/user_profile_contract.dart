import 'package:medkit/common/enums/gender.dart';

class UserProfileContract {
  final String email;
  final String firstName;
  final String lastName;
  final String profilePictureUrl;
  final DateTime dateOfBirth;
  final Gender gender;

  const UserProfileContract({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePictureUrl,
    required this.dateOfBirth,
    required this.gender,
  });
}
