import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/features/user/domain/mapping/user_mapper.auto_mappr.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact_contract.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile.dart';
import 'package:medkit/features/user/domain/models/user_medical_profile_contract.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/domain/models/user_profile_contract.dart';

@AutoMappr(<MapType<Object, Object>>[
  MapType<UserProfileContract, UserProfile>(),
  MapType<UserMedicalProfileContract, UserMedicalProfile>(),
  MapType<UserEmergencyContactContract, UserEmergencyContact>(),
])
@lazySingleton
class UserMapper extends $UserMapper {
  T mapObject<S, T>(S? object) => convert(object);

  Iterable<T> mapObjects<S, T>(Iterable<S> objects) => convertIterable(objects);
}
