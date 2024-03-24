import 'package:flutter/material.dart';
import 'package:medkit/common/resources/assets.gen.dart';
import 'package:medkit/common/utils/intl_utils.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/spaced_row.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/domain/models/appointment.dart';
import 'package:medkit/features/appointments/domain/models/appointment_category.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';
import 'package:medkit/features/appointments/presentation/view_models/appointments_list_view_model.dart';

class AppointmentsListView extends StatelessWidget {
  final bool itemsExpanded;

  const AppointmentsListView({this.itemsExpanded = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentsListViewModel>(
      create: (_) => ServiceLocator.get<AppointmentsListViewModel>(),
      builder: (BuildContext context, AppointmentsListViewModel viewModel) {
        return _AppointmentsListViewBody(itemsExpanded: itemsExpanded);
      },
    );
  }
}

class _AppointmentsListViewBody extends StatelessWidget {
  final bool itemsExpanded;

  const _AppointmentsListViewBody({required this.itemsExpanded});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Iterable<Appointment>>(
      valueListenable: context.viewModel<AppointmentsListViewModel>().appointments,
      builder: (BuildContext context, Iterable<Appointment> appointments, Widget? child) {
        if (appointments.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(context.il8n.noUpcomingAppointments),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: appointments.length,
          itemBuilder: (BuildContext context, int index) {
            final Appointment appointment = appointments.elementAt(index);
            return _AppointmentListTile(
              appointment,
              () {},
              itemsExpanded: itemsExpanded,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16);
          },
        );
      },
    );
  }
}

class _AppointmentListTile extends StatelessWidget {
  final Appointment appointment;
  final void Function() onTap;
  final bool itemsExpanded;

  const _AppointmentListTile(this.appointment, this.onTap, {this.itemsExpanded = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: _getAppointmentIcon(appointment.appointmentCategory).image(width: 20, height: 20),
      title: Text(
        appointment.title,
        style: context.theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.theme.colorScheme.primary,
        ),
      ),
      isThreeLine: itemsExpanded,
      subtitle: itemsExpanded
          ? SpacedColumn(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  appointment.doctor,
                  style: context.theme.textTheme.labelSmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                SpacedRow(
                  spacing: 8,
                  children: <Widget>[
                    Icon(
                      Icons.videocam_rounded,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      appointment.appointmentType.localizedName,
                      style: context.theme.textTheme.labelSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                )
              ],
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: Chip(
        backgroundColor: Colors.indigo.shade200,
        label: Text(
          appointment.date.monthDay,
          style: context.theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.colorScheme.primary,
          ),
        ),
        padding: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.indigo.shade200, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      onTap: onTap,
    );
  }

  static AssetGenImage _getAppointmentIcon(AppointmentCategory appointmentCategory) {
    switch (appointmentCategory) {
      case AppointmentCategory.general:
        return Assets.graphics.icStethoscope;
      case AppointmentCategory.cardiology:
        return Assets.graphics.icHeartVital;
    }
  }
}
