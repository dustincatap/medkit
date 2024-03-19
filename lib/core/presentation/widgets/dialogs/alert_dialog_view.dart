import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/widgets/dialogs/base_dialog_view.dart';

@RoutePage()
class AlertDialogView extends BaseDialogView {
  const AlertDialogView({
    @QueryParam('message') super.message,
    @QueryParam('title') super.title,
    @QueryParam('primaryText') super.primaryText,
    @QueryParam('secondaryText') super.secondaryText,
  }) : super(key: const Key(AlertDialogViewRoute.name));
}
