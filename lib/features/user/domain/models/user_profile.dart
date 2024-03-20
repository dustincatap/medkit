import 'package:medkit/common/enums/gender.dart';

class UserProfile {
  static UserProfile empty = UserProfile(
    email: '',
    firstName: '',
    lastName: '',
    profilePictureUrl: '',
    dateOfBirth: DateTime.now(),
    gender: Gender.other,
  );

  final String email;
  final String firstName;
  final String lastName;
  final String profilePictureUrl;
  final DateTime dateOfBirth;
  final Gender gender;

  const UserProfile({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePictureUrl,
    required this.dateOfBirth,
    required this.gender,
  });

  String get fullName => '$firstName $lastName';
}
