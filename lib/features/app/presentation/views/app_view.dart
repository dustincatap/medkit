import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medkit/common/localization/generated/l10n.dart';
import 'package:medkit/core/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/navigation/navigation_logger.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.dart';

class App extends StatefulWidget {
  const App({super.key, this.initialRoute});

  final PageRouteInfo? initialRoute;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final NavigationRouter _rootStackRouter = ServiceLocator.get<NavigationRouter>();
  final NavigationLogger _navigationLogger = ServiceLocator.get<NavigationLogger>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _rootStackRouter.routeInformationParser,
      routerDelegate: AutoRouterDelegate(
        _rootStackRouter,
        initialRoutes: _getInitialRoutes(),
        navigatorObservers: () => <NavigatorObserver>[
          _navigationLogger,
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        Il8n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Il8n.delegate.supportedLocales,
    );
  }

  List<PageRouteInfo>? _getInitialRoutes() {
    final List<PageRouteInfo> initialRoutes = <PageRouteInfo>[];
    final PageRouteInfo? appInitialRoute = widget.initialRoute;

    if (appInitialRoute != null) {
      initialRoutes.add(appInitialRoute);
    }

    return initialRoutes.isEmpty ? null : initialRoutes;
  }
}
