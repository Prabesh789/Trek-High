import 'package:auto_route/auto_route.dart';
import 'package:trek_high/features/auth/login_screen/login_screen.dart';
import 'package:trek_high/features/landing_screen/presentation/landing_screen.dart';
import 'package:trek_high/features/main_dashboard/presentation/main_dashboard_Screen/main_dashboard_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<void>(
      // page: AppStateObserver,
      page: LandingScreen,
      initial: true,
    ),
    AutoRoute<void>(
      page: MainDashboardScreen,
    ),
    AutoRoute<void>(
      page: LoginScreen,
    )
  ],
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
