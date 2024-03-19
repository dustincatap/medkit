import 'package:injectable/injectable.dart';
import 'package:medkit/core/presentation/navigation/navigation_router.gr.dart';
import 'package:medkit/core/presentation/navigation/navigation_service.dart';

@injectable
class LandingViewModel {
  final NavigationService _navigationService;

  LandingViewModel(this._navigationService);

  Future<void> onStart() async {
    _navigationService.pushToNewRoot(const DashboardViewRoute());
  }
}
