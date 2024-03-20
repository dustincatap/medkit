import 'package:medkit/common/localization/generated/l10n.dart';

enum Gender { male, female, other }

extension GenderExtension on Gender {
  String get localizedName {
    switch (this) {
      case Gender.male:
        return Il8n.current.genderMale;
      case Gender.female:
        return Il8n.current.genderFemale;
      case Gender.other:
        return Il8n.current.genderOther;
    }
  }
}
