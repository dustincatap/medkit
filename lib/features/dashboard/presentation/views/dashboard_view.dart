import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/med_kit_text.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/presentation/views/appointment_medical_grid_list_view.dart';
import 'package:medkit/features/appointments/presentation/views/appointments_list_view.dart';
import 'package:medkit/features/dashboard/presentation/view_models/dashboard_view_model.dart';
import 'package:medkit/features/medications/presentation/views/medication_grid_list_view.dart';
import 'package:medkit/features/user/presentation/views/user_profile_app_bar_view.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView() : super(key: const Key(DashboardViewRoute.name));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>(
      create: (_) => ServiceLocator.get<DashboardViewModel>(),
      builder: (BuildContext context, DashboardViewModel viewModel) {
        return const _DashboardViewBody();
      },
    );
  }
}

class _DashboardViewBody extends StatelessWidget {
  const _DashboardViewBody();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UserProfileAppBarView(
        centerTitle: true,
        title: MedKitText(fontSize: 20),
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: _DashboardViewContent(),
        ),
      ),
    );
  }
}

class _DashboardViewContent extends StatelessWidget {
  const _DashboardViewContent();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 28,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: context.il8n.searchDoctorsAppointments,
            suffixIcon: const Icon(Icons.search),
          ),
        ),
        const _DashboardViewAppointmentsList(),
        const _DashboardCurrentMedicationsGridList(),
        const _DashboardViewFindYourDoctorGridList(),
      ],
    );
  }
}

class _DashboardViewAppointmentsList extends StatelessWidget {
  const _DashboardViewAppointmentsList();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              context.il8n.upcomingAppointments,
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: context.viewModel<DashboardViewModel>().onNavigateToAppointments,
              child: Text(context.il8n.generalViewAll),
            ),
          ],
        ),
        const AppointmentsListView(),
      ],
    );
  }
}

class _DashboardCurrentMedicationsGridList extends StatelessWidget {
  const _DashboardCurrentMedicationsGridList();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              context.il8n.currentMedications,
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: context.viewModel<DashboardViewModel>().onNavigateToMedications,
              child: Text(context.il8n.generalViewAll),
            ),
          ],
        ),
        const MedicationGridListView(),
      ],
    );
  }
}

class _DashboardViewFindYourDoctorGridList extends StatelessWidget {
  const _DashboardViewFindYourDoctorGridList();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              context.il8n.findYourDoctor,
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(context.il8n.generalViewAll),
            ),
          ],
        ),
        const AppointmentMedicalGridListView(),
      ],
    );
  }
}
