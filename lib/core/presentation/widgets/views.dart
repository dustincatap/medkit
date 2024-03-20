import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:medkit/core/presentation/view_models/initializable.dart';

class ViewModelProvider<T> extends InheritedWidget {
  const ViewModelProvider({
    required this.viewModel,
    required super.child,
    super.key,
  });

  final T viewModel;

  static ViewModelProvider<T> of<T>(BuildContext context) {
    final ViewModelProvider<T>? viewModelProvider = context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();

    if (viewModelProvider == null) {
      throw StateError('ViewModelProvider is not found');
    }

    return viewModelProvider;
  }

  @override
  bool updateShouldNotify(ViewModelProvider<T> oldWidget) {
    return true;
  }
}

class ViewModelBuilder<TViewModel> extends StatefulWidget {
  const ViewModelBuilder({
    required this.create,
    required this.builder,
    this.dispose,
    super.key,
  });

  final TViewModel Function(BuildContext context) create;
  final Widget Function(BuildContext context, TViewModel viewModel) builder;
  final void Function(BuildContext context, TViewModel viewModel)? dispose;

  @override
  State<StatefulWidget> createState() => _ViewModelBuilderState<TViewModel>();
}

class _ViewModelBuilderState<TViewModel> extends State<ViewModelBuilder<TViewModel>> {
  TViewModel? _currentViewModel;

  TViewModel get _viewModel {
    if (_currentViewModel == null) {
      throw StateError('ViewModel is not initialized');
    }

    return _currentViewModel!;
  }

  @override
  void initState() {
    super.initState();

    final TViewModel viewModel = widget.create(context);

    if (viewModel is Initializable) {
      unawaited(viewModel.onInitialize());
    }

    _currentViewModel = viewModel;
  }

  @override
  void dispose() {
    widget.dispose?.call(context, _viewModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TViewModel>(
      viewModel: _viewModel,
      child: widget.builder(context, _viewModel),
    );
  }
}

extension ViewModelProviderExtension on BuildContext {
  T viewModel<T>() {
    return ViewModelProvider.of<T>(this).viewModel;
  }
}
