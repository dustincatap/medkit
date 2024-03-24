import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';

abstract interface class NavigationRouter implements StackRouter {
  RouteInformationParser<Object> get routeInformationParser;
}

@LazySingleton(as: NavigationRouter)
@AutoRouterConfig(replaceInRouteName: 'View,ViewRoute')
class NavigationRouterImpl extends $NavigationRouterImpl implements NavigationRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  RouteInformationParser<Object> get routeInformationParser => root.defaultRouteParser();

  @override
  List<AutoRoute> get routes {
    return <AutoRoute>[
      AutoRoute(page: LandingViewRoute.page, path: '/'),
      AutoRoute(page: DashboardViewRoute.page, path: '/dashboard'),
      AutoRoute(page: UserProfileViewRoute.page, path: '/user-profile'),
      AutoRoute(page: YourAppointmentsListViewRoute.page, path: '/appointments'),
      AutoRoute(page: BookYourAppointmentViewRoute.page, path: '/appointments/book'),
      AutoRoute(page: MyMedicationGridListViewRoute.page, path: '/medications'),
    ];
  }
}
