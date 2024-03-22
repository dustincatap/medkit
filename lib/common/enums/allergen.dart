import 'package:medkit/common/localization/generated/l10n.dart';

enum Allergen { shellfish, fruit }

extension AllergenExtension on Allergen {
  String get localizedName {
    switch (this) {
      case Allergen.shellfish:
        return Il8n.current.allergenShellfish;
      case Allergen.fruit:
        return Il8n.current.allergenFruit;
    }
  }
}
