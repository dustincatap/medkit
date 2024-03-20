import 'package:flutter/material.dart';
import 'package:medkit/common/enums/medicine.dart';
import 'package:medkit/common/resources/assets.gen.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/features/medications/domain/models/medication.dart';

class MedicationGridListView extends StatelessWidget {
  final Iterable<Medication> medications;
  final void Function(Medication) onTap;

  const MedicationGridListView({required this.medications, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: medications.length,
      itemBuilder: (BuildContext context, int index) {
        final Medication medication = medications.elementAt(index);
        return _MedicationGridListItem(medication, () => onTap(medication));
      },
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
