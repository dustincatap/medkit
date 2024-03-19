import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:medkit/core/dependency_injection/service_registrar.config.dart';

@InjectableInit(
  initializerName: r'$register',
  preferRelativeImports: false,
  asExtension: false,
)
abstract class ServiceRegistrar {
  static void register() {
    final GetIt getIt = GetIt.instance..allowReassignment = true;
    $register(getIt);
  }
}
