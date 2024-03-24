import 'package:flutter/material.dart';
import 'package:medkit/common/enums/medicine.dart';
import 'package:medkit/common/resources/assets.gen.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';
import 'package:medkit/features/medications/presentation/view_models/medication_grid_list_view_model.dart';

class MedicationGridListView extends StatelessWidget {
  final bool canAdd;

  const MedicationGridListView({this.canAdd = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MedicationGridListViewModel>(
      create: (_) => ServiceLocator.get<MedicationGridListViewModel>(),
      builder: (BuildContext context, MedicationGridListViewModel viewModel) {
        return _MedicationGridListViewBody(canAdd: canAdd);
      },
    );
  }
}

class _MedicationGridListViewBody extends StatelessWidget {
  final bool canAdd;

  const _MedicationGridListViewBody({required this.canAdd});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Iterable<Medication>>(
      valueListenable: context.viewModel<MedicationGridListViewModel>().medications,
      builder: (BuildContext context, Iterable<Medication> medications, Widget? child) {
        if (medications.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(context.il8n.noMedications),
            ),
          );
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 120,
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: canAdd ? medications.length + 1 : medications.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == medications.length) {
              return const _MedicationGridListItemAdd();
            }

            final Medication medication = medications.elementAt(index);
            return _MedicationGridListItem(
              medication,
              () {},
            );
          },
        );
      },
    );
  }
}

class _MedicationGridListItemAdd extends StatelessWidget {
  const _MedicationGridListItemAdd();

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.grey.shade500;
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: color.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Icon(
          Icons.add,
          size: 24,
          color: color,
        ),
      ),
    );
  }
}

class _MedicationGridListItem extends StatelessWidget {
  final Medication medication;
  final void Function() onTap;

  const _MedicationGridListItem(this.medication, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: SpacedColumn(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _MedicationIconImage(medication.medicine),
            Text(
              medication.medicine.localizedName,
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

class _MedicationIconImage extends StatelessWidget {
  final Medicine medicine;

  const _MedicationIconImage(this.medicine);

  @override
  Widget build(BuildContext context) {
    final AssetGenImage medicationImage = switch (medicine) {
      Medicine.paracetamol => Assets.graphics.icParacetamol,
      Medicine.vitaminC => Assets.graphics.icVitaminC,
      Medicine.vitaminD => Assets.graphics.icVitaminD,
    };

    return medicationImage.image(width: 40, height: 40);
  }
}
