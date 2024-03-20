import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medkit/common/localization/generated/l10n.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
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
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
    );

    unawaited(SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]));
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blueGrey.shade900;

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
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          background: Colors.grey.shade50,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 48)),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIconColor: Colors.grey.shade600,
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
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
