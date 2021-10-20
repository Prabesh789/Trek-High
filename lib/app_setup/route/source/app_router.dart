import 'package:auto_route/auto_route.dart';
import 'package:trek_high/features/auth/login_screen/login_screen.dart';
import 'package:trek_high/features/auth/sign_screen/sign_up_screen.dart';
import 'package:trek_high/features/landing_screen/landing_screen.dart';
import 'package:trek_high/features/main_dashboard/presentation/main_dashboard_screen.dart';

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
    ),
    AutoRoute<void>(
      page: SignupScreen,
    )
  ],
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
