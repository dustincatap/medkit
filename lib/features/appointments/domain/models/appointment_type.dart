import 'package:medkit/common/localization/generated/l10n.dart';

enum AppointmentType { video, chat }

extension AppointmentTypeExtension on AppointmentType {
  String get localizedName {
    switch (this) {
      case AppointmentType.video:
        return Il8n.current.appointmentTypeVideo;
      case AppointmentType.chat:
        return Il8n.current.appointmentTypeChat;
    }
  }

  String get trimmedLocalizedName => localizedName.split(' ').first;
}
