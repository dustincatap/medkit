import 'package:medkit/common/localization/generated/l10n.dart';

enum Medicine { paracetamol, vitaminC, vitaminD }

extension MedicineExtension on Medicine {
  String get localizedName {
    switch (this) {
      case Medicine.paracetamol:
        return Il8n.current.medicineParacetamol;
      case Medicine.vitaminC:
        return Il8n.current.medicineVitaminC;
      case Medicine.vitaminD:
        return Il8n.current.medicineVitaminD;
    }
  }
}
