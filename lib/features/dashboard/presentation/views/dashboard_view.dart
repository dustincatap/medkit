import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/med_kit_text.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/presentation/widgets/appointments_list_view.dart';
import 'package:medkit/features/dashboard/presentation/view_models/dashboard_view_model.dart';
import 'package:medkit/features/doctors/presentation/widgets/medical_field_grid_list_view.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/presentation/widgets/medication_grid_list_view.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';

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
      appBar: _DashboardViewAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: _DashboardViewContent(),
        ),
      ),
    );
  }
}

class _DashboardViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _DashboardViewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const MedKitText(fontSize: 20),
      leading: const Icon(Icons.menu),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ValueListenableBuilder<UserProfile>(
            valueListenable: context.viewModel<DashboardViewModel>().userProfile,
            builder: (BuildContext context, UserProfile userProfile, _) {
              return CircleAvatar(
                foregroundImage: userProfile.profilePictureUrl.isNotEmpty
                    ? Image.network(userProfile.profilePictureUrl).image
                    : null,
                child: const Icon(Icons.person),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DashboardViewContent extends StatelessWidget {
  const _DashboardViewContent();

  @override
  Widget build(BuildContext context) {
    return const SpacedColumn(
      spacing: 28,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: 'Search doctors, appointments...',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        _DashboardViewAppointmentsList(),
        _DashboardCurrentMedicationsGridList(),
        _DashboardViewFindYourDoctorGridList(),
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
              'Upcoming appointments',
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        ValueListenableBuilder<Iterable<Appointment>>(
          valueListenable: context.viewModel<DashboardViewModel>().appointments,
          builder: (BuildContext context, Iterable<Appointment> appointments, Widget? child) {
            if (appointments.isEmpty) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Text('No upcoming appointments'),
                ),
              );
            }

            return AppointmentsListView(
              appointments: appointments,
              onTap: (_) {},
            );
          },
        )
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
              'Current medications',
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        ValueListenableBuilder<Iterable<Medication>>(
          valueListenable: context.viewModel<DashboardViewModel>().medications,
          builder: (BuildContext context, Iterable<Medication> medications, Widget? child) {
            if (medications.isEmpty) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Text('No medications'),
                ),
              );
            }

            return MedicationGridListView(
              medications: medications,
              onTap: (_) {},
            );
          },
        ),
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
              'Find your doctor',
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        MedicalFieldGridListView(onTap: (_) {}),
      ],
    );
  }
}
