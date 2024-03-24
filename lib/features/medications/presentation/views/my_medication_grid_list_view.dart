import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/medications/presentation/view_models/my_medication_grid_list_view_model.dart';
import 'package:medkit/features/medications/presentation/views/medication_grid_list_view.dart';
import 'package:medkit/features/user/presentation/views/user_profile_app_bar_view.dart';

@RoutePage()
class MyMedicationGridListView extends StatelessWidget {
  const MyMedicationGridListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyMedicationGridListViewModel>(
      create: (_) => ServiceLocator.get<MyMedicationGridListViewModel>(),
      builder: (BuildContext context, MyMedicationGridListViewModel viewModel) {
        return const _MyMedicationGridListViewBody();
      },
    );
  }
}

class _MyMedicationGridListViewBody extends StatelessWidget {
  const _MyMedicationGridListViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileAppBarView(
        centerTitle: false,
        title: Text(context.il8n.myMedications),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MedicationGridListView(canAdd: true),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(context.il8n.medicationAskForPrescription),
            ),
          ],
        ),
      ),
    );
  }
}
