import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_registrar.dart';
import 'package:medkit/core/infrastructure/logging/logger.dart';
import 'package:medkit/features/app/presentation/views/app_view.dart';

void main() {
  ServiceRegistrar.register();
  Logger.initialize();
  runApp(const App());
}
