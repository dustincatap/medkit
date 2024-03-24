import 'package:flutter/material.dart';
import 'package:medkit/common/enums/medical_field.dart';
import 'package:medkit/common/resources/assets.gen.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/appointments/presentation/view_models/appointment_medical_grid_list_view_model.dart';

class AppointmentMedicalGridListView extends StatelessWidget {
  const AppointmentMedicalGridListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentMedicalGridListViewModel>(
      create: (_) => ServiceLocator.get<AppointmentMedicalGridListViewModel>(),
      builder: (BuildContext context, AppointmentMedicalGridListViewModel viewModel) {
        return const _MedicalFieldGridListViewBody();
      },
    );
  }
}

class _MedicalFieldGridListViewBody extends StatelessWidget {
  const _MedicalFieldGridListViewBody();

  @override
  Widget build(BuildContext context) {
    final Iterable<MedicalField> medicalFields = context.viewModel<AppointmentMedicalGridListViewModel>().medicalFields;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: medicalFields.length,
      itemBuilder: (BuildContext context, int index) {
        final MedicalField field = medicalFields.elementAt(index);
        return _MedicalFieldGridListItem(
          field,
          context.viewModel<AppointmentMedicalGridListViewModel>().onNavigateToAppointmentBooking,
        );
      },
    );
  }
}

class _MedicalFieldGridListItem extends StatelessWidget {
  final MedicalField field;
  final void Function(MedicalField) onTap;

  const _MedicalFieldGridListItem(this.field, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onTap(field),
        child: SpacedColumn(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _MedicalFieldIconImage(field),
            Text(
              field.localizedPractitionerName,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicalFieldIconImage extends StatelessWidget {
  final MedicalField field;

  const _MedicalFieldIconImage(this.field);

  @override
  Widget build(BuildContext context) {
    final AssetGenImage fieldImage = switch (field) {
      MedicalField.dentistry => Assets.graphics.icMedicalFieldDentistry,
      MedicalField.cardiology => Assets.graphics.icMedicalFieldCardiology,
      MedicalField.genetics => Assets.graphics.icMedicalFieldGenetics,
      MedicalField.nursing => Assets.graphics.icMedicalFieldNursing,
      MedicalField.virology => Assets.graphics.icMedicalFieldVirology,
      MedicalField.general || MedicalField.unknown => Assets.graphics.icMedicalFieldGeneral,
    };

    return fieldImage.image(width: 40, height: 40);
  }
}
