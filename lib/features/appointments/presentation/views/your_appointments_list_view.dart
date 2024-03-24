import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/presentation/view_models/your_appointments_list_view_model.dart';
import 'package:medkit/features/appointments/presentation/views/appointments_list_view.dart';
import 'package:medkit/features/user/presentation/views/user_profile_app_bar_view.dart';

@RoutePage()
class YourAppointmentsListView extends StatelessWidget {
  const YourAppointmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YourAppointmentsListViewModel>(
      create: (_) => ServiceLocator.get<YourAppointmentsListViewModel>(),
      builder: (BuildContext context, YourAppointmentsListViewModel viewModel) {
        return const _YourAppointmentsListViewBody();
      },
    );
  }
}

class _YourAppointmentsListViewBody extends StatelessWidget {
  const _YourAppointmentsListViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileAppBarView(
        centerTitle: false,
        title: Text(context.il8n.yourAppointments),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const AppointmentsListView(itemsExpanded: true),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(context.il8n.appointmentBookNew),
            ),
          ],
        ),
      ),
    );
  }
}
