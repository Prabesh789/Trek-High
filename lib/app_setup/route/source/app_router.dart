import 'package:auto_route/auto_route.dart';
import 'package:trek_high/features/auth/presentation/login_screen/login_screen.dart';
import 'package:trek_high/features/auth/presentation/sign_screen/sign_up_screen.dart';
import 'package:trek_high/features/landing_screen/landing_screen.dart';
import 'package:trek_high/features/main_dashboard/presentation/bottom_navigation.dart';
import 'package:trek_high/features/notification/presentation/notification_screen.dart';
import 'package:trek_high/features/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<void>(
      // page: AppStateObserver,
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute<void>(
      page: LandingScreen,
    ),
    AutoRoute<void>(
      page: BottomNavigationScreen,
    ),
    AutoRoute<void>(
      page: LoginScreen,
    ),
    AutoRoute<void>(
      page: SignupScreen,
    ),
    AutoRoute<void>(
      page: NotificationScreen,
    )
  ],
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
