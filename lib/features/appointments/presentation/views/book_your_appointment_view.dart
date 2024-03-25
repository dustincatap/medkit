import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/common/utils/intl_utils.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/spaced_row.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/domain/models/appointment_type.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 32,
          children: <Widget>[
            const _BookYourAppointmentFieldAndDoctorSelection(),
            const _BookYourAppointmentTypeSelection(),
            const _BookYourAppointmentDateSelection(),
            const _BookYourAppointmentTimeSelection(),
            ElevatedButton(
              onPressed: () {},
              child: Text(context.il8n.bookNowAppointment),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookYourAppointmentFieldAndDoctorSelection extends StatelessWidget {
  const _BookYourAppointmentFieldAndDoctorSelection();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: <Widget>[
        Text(
          'Field',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              value: 'Dentist',
              enableFeedback: false,
              items: <String>['Dentist', 'Cardiologist']
                  .map((String e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (_) {},
              isExpanded: true,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
        Text(
          'Doctor',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              value: 'Dr. Eva',
              enableFeedback: false,
              items: <String>['Dr. Eva', 'Dr. John', 'Dr. Smith']
                  .map((String e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (_) {},
              isExpanded: true,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BookYourAppointmentTypeSelection extends StatelessWidget {
  const _BookYourAppointmentTypeSelection();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: <Widget>[
        Text(
          'Appointment Type',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        ValueListenableBuilder<AppointmentType>(
          valueListenable: context.viewModel<BookYourAppointmentViewModel>().selectedAppointmentType,
          builder: (BuildContext context, AppointmentType appointmentType, _) {
            return _SelectableButtonGroup<AppointmentType>(
              items: AppointmentType.values,
              onChanged: context.viewModel<BookYourAppointmentViewModel>().onSelectedAppointmentTypeChanged,
              selectedValue: appointmentType,
              isSelected: (AppointmentType value) => value == appointmentType,
              itemSize: const Size(0, 56),
              itemBuilder: (AppointmentType value) {
                return Text(value.trimmedLocalizedName);
              },
            );
          },
        ),
      ],
    );
  }
}

class _BookYourAppointmentDateSelection extends StatelessWidget {
  const _BookYourAppointmentDateSelection();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: <Widget>[
        Text(
          'Selected Date',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        ValueListenableBuilder<DateTime>(
          valueListenable: context.viewModel<BookYourAppointmentViewModel>().selectedDate,
          builder: (BuildContext context, DateTime date, _) {
            return _SelectableButtonGroup<DateTime>(
              items: context.viewModel<BookYourAppointmentViewModel>().availableDates,
              onChanged: context.viewModel<BookYourAppointmentViewModel>().onSelectedDateChanged,
              selectedValue: date,
              isSelected: (DateTime value) => value.monthDay == date.monthDay,
              itemBuilder: (DateTime value) {
                return Column(
                  children: <Widget>[
                    Text(value.shortDay),
                    Text(value.monthDay),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _BookYourAppointmentTimeSelection extends StatelessWidget {
  const _BookYourAppointmentTimeSelection();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: <Widget>[
        Text(
          'Selected Time',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        ValueListenableBuilder<String>(
          valueListenable: context.viewModel<BookYourAppointmentViewModel>().selectedTime,
          builder: (BuildContext context, String time, _) {
            return _SelectableButtonGroup<String>(
              items: context.viewModel<BookYourAppointmentViewModel>().availableTimes,
              onChanged: context.viewModel<BookYourAppointmentViewModel>().onSelectedTimeChanged,
              selectedValue: time,
              isSelected: (String value) => value == time,
              isGrid: true,
              itemSize: const Size(40, 92),
              itemPadding: const EdgeInsets.symmetric(horizontal: 12),
            );
          },
        ),
      ],
    );
  }
}

class _SelectableButtonGroup<T> extends StatelessWidget {
  final Iterable<T> items;
  final ValueChanged<T> onChanged;
  final T? selectedValue;
  final bool Function(T value)? isSelected;
  final Size itemSize;
  final Widget Function(T)? itemBuilder;
  final EdgeInsets? itemPadding;
  final bool isGrid;

  const _SelectableButtonGroup({
    required this.items,
    required this.onChanged,
    this.selectedValue,
    this.isSelected,
    this.itemSize = const Size(0, 56),
    this.itemBuilder,
    this.itemPadding,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    final List<ElevatedButton> children = items.map((T e) {
      final bool isSelected = this.isSelected?.call(e) ?? e == selectedValue;
      return ElevatedButton(
        onPressed: () => onChanged(e),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          padding: itemPadding,
          minimumSize: itemSize,
          foregroundColor: isSelected ? context.theme.colorScheme.primary : Colors.grey.shade500,
          backgroundColor: isSelected ? Colors.grey.shade300 : Colors.white,
        ),
        child: itemBuilder?.call(e) ?? Text(e.toString()),
      );
    }).toList();

    if (isGrid) {
      return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.4,
        children: children,
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SpacedRow(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: children,
      ),
    );
  }
}
