import 'package:medkit/common/localization/generated/l10n.dart';

enum MedicalField {
  unknown,
  general,
  dentistry,
  genetics,
  nursing,
  virology,
  cardiology,
}

extension MedicalFieldExtension on MedicalField {
  String get localizedPractitionerName {
    switch (this) {
      case MedicalField.unknown:
        return Il8n.current.medicalFieldUnknown;
      case MedicalField.general:
        return Il8n.current.medicalFieldGeneral;
      case MedicalField.dentistry:
        return Il8n.current.medicalFieldDentist;
      case MedicalField.genetics:
        return Il8n.current.medicalFieldGeneticist;
      case MedicalField.nursing:
        return Il8n.current.medicalFieldNurse;
      case MedicalField.virology:
        return Il8n.current.medicalFieldVirologist;
      case MedicalField.cardiology:
        return Il8n.current.medicalFieldCardiologist;
    }
  }
}
