import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/presentation/view_models/book_your_appointment_view_model.dart';
import 'package:medkit/features/user/presentation/views/user_profile_app_bar_view.dart';

@RoutePage()
class BookYourAppointmentView extends StatelessWidget {
  final MedicalField initialMedicalField;

  const BookYourAppointmentView({required this.initialMedicalField, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookYourAppointmentViewModel>(
      create: (_) => ServiceLocator.get<BookYourAppointmentViewModel>(),
      initializationParameter: () => initialMedicalField,
      builder: (BuildContext context, BookYourAppointmentViewModel viewModel) {
        return const _BookYourAppointmentViewBody();
      },
    );
  }
}

class _BookYourAppointmentViewBody extends StatelessWidget {
  const _BookYourAppointmentViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileAppBarView(
        centerTitle: false,
        title: Text(context.il8n.bookYourAppointment),
      ),
    );
  }
}
