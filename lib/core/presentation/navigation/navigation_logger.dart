import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/infrastructure/logging/logger.dart';

@lazySingleton
class NavigationLogger extends RouteObserver<ModalRoute<Object?>> {
  final Logger _logger;

  NavigationLogger(this._logger) {
    _logger.logFor(this);
  }

  @override
  void didPush(covariant Route<Object?> route, covariant Route<Object?>? previousRoute) {
    super.didPush(route, previousRoute);
    _logger.info('${_getRoutePath(previousRoute)} === PUSHED ==> ${_getRoutePath(route)}');
  }

  @override
  void didPop(covariant Route<Object?> route, covariant Route<Object?>? previousRoute) {
    super.didPop(route, previousRoute);
    _logger.info('${_getRoutePath(route)} === POPPED ==> ${_getRoutePath(previousRoute)}');
  }

  @override
  void didReplace({covariant Route<Object?>? newRoute, covariant Route<Object?>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logger.info('${_getRoutePath(oldRoute)} === REPLACED ==> ${_getRoutePath(newRoute)}');
  }

  static String _getRoutePath(Route<Object?>? route) {
    final RouteSettings? routeSettings = route?.settings;

    if (routeSettings is AutoRoutePage) {
      final RouteData routeData = routeSettings.routeData;

      return routeData.path;
    }

    return routeSettings?.name ?? '';
  }
}
