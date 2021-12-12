import 'package:auto_route/auto_route.dart';
import 'package:trek_high/admin/presentation/admin_dasbboard_screen.dart';
import 'package:trek_high/admin/presentation/destinations/destinations_screen.dart';
import 'package:trek_high/admin/presentation/user_list/user_list_screen.dart';
import 'package:trek_high/features/auth/presentation/login_screen/login_screen.dart';
import 'package:trek_high/features/auth/presentation/sign_screen/sign_up_screen.dart';
import 'package:trek_high/features/find_friends/presentation/widgets/post_travel_screen.dart';
import 'package:trek_high/features/home_screen/presentation/destination_details/destinations_detail_screen.dart';
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
    ),
    AutoRoute<void>(
      page: AdminDashboardScreen,
    ),
    AutoRoute<void>(
      page: DestinationScreen,
    ),
    AutoRoute<void>(
      page: UserListScreen,
    ),
    AutoRoute<void>(
      page: DestinationDetailScreen,
    ),
    AutoRoute<void>(
      page: PostTravelScreen,
    )
  ],
  preferRelativeImports: true,
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
