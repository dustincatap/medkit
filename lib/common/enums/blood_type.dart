import 'package:medkit/common/localization/generated/l10n.dart';

enum BloodType { unkown, aPositive, aNegative, bPositive, bNegative, abPositive, abNegative, oPositive, oNegative }

extension BloodTypeExtension on BloodType {
  String get localizedName {
    switch (this) {
      case BloodType.aPositive:
        return Il8n.current.bloodTypeAPositive;
      case BloodType.aNegative:
        return Il8n.current.bloodTypeANegative;
      case BloodType.bPositive:
        return Il8n.current.bloodTypeBPositive;
      case BloodType.bNegative:
        return Il8n.current.bloodTypeBNegative;
      case BloodType.abPositive:
        return Il8n.current.bloodTypeABPositive;
      case BloodType.abNegative:
        return Il8n.current.bloodTypeABNegative;
      case BloodType.oPositive:
        return Il8n.current.bloodTypeOPositive;
      case BloodType.oNegative:
        return Il8n.current.bloodTypeONegative;
      case BloodType.unkown:
        return Il8n.current.bloodTypeUnknown;
    }
  }
}
