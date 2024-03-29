import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.dart';

@lazySingleton
class NavigationService {
  final NavigationRouter _router;

  NavigationService(this._router);

  Future<T?> push<T extends Object>(PageRouteInfo route, {OnNavigationFailure? onFailure}) async {
    final T? result = await _router.push(route, onFailure: onFailure) as T?;

    return result;
  }

  void pushToNewRoot(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    _router.popUntilRoot();
    unawaited(replace(route, onFailure: onFailure)); // This future does not complete
  }

  Future<T?> replace<T extends Object>(PageRouteInfo route, {OnNavigationFailure? onFailure}) async {
    final T? result = await _router.replace(route, onFailure: onFailure) as T?;

    return result;
  }

  Future<void> pop<T extends Object>([T? result]) async {
    await _router.maybePop(result);
  }
}
