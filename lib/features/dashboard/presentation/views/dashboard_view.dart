import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/dashboard/presentation/view_models/dashboard_view_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
    );
  }
}
