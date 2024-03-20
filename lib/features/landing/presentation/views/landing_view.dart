import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/common/resources/assets.gen.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/med_kit_text.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/landing/presentation/view_models/landing_view_model.dart';

@RoutePage()
class LandingView extends StatelessWidget {
  const LandingView() : super(key: const Key(LandingViewRoute.name));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>(
      create: (_) => ServiceLocator.get<LandingViewModel>(),
      builder: (BuildContext context, LandingViewModel viewModel) {
        return const _LandingViewBody();
      },
    );
  }
}

class _LandingViewBody extends StatelessWidget {
  const _LandingViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Spacer(),
            const _LandingViewMedKit(),
            const Spacer(),
            ElevatedButton(
              onPressed: context.viewModel<LandingViewModel>().onStart,
              child: Text(context.il8n.generalStart),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandingViewMedKit extends StatelessWidget {
  const _LandingViewMedKit();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 24,
      children: <Widget>[
        Assets.graphics.icMedkit.image(width: 224),
        const MedKitText(),
      ],
    );
  }
}
