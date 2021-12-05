// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../admin/presentation/admin_dasbboard_screen.dart' as _i9;
import '../../../admin/presentation/destinations/destinations_screen.dart'
    as _i10;
import '../../../admin/presentation/user_list/user_list_screen.dart' as _i11;
import '../../../features/auth/presentation/login_screen/login_screen.dart'
    as _i6;
import '../../../features/auth/presentation/sign_screen/sign_up_screen.dart'
    as _i7;
import '../../../features/landing_screen/landing_screen.dart' as _i4;
import '../../../features/main_dashboard/presentation/bottom_navigation.dart'
    as _i5;
import '../../../features/notification/presentation/notification_screen.dart'
    as _i8;
import '../../../features/splash_screen/splash_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        }),
    LandingRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LandingScreen();
        }),
    BottomNavigationRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i5.BottomNavigationScreen();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i6.LoginScreen();
        }),
    SignupRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i7.SignupScreen();
        }),
    NotificationRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i8.NotificationScreen();
        }),
    AdminDashboardRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i9.AdminDashboardScreen();
        }),
    DestinationRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i10.DestinationScreen();
        }),
    UserListRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i11.UserListScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(LandingRoute.name, path: '/landing-screen'),
        _i1.RouteConfig(BottomNavigationRoute.name,
            path: '/bottom-navigation-screen'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i1.RouteConfig(SignupRoute.name, path: '/signup-screen'),
        _i1.RouteConfig(NotificationRoute.name, path: '/notification-screen'),
        _i1.RouteConfig(AdminDashboardRoute.name,
            path: '/admin-dashboard-screen'),
        _i1.RouteConfig(DestinationRoute.name, path: '/destination-screen'),
        _i1.RouteConfig(UserListRoute.name, path: '/user-list-screen')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class LandingRoute extends _i1.PageRouteInfo {
  const LandingRoute() : super(name, path: '/landing-screen');

  static const String name = 'LandingRoute';
}

class BottomNavigationRoute extends _i1.PageRouteInfo {
  const BottomNavigationRoute()
      : super(name, path: '/bottom-navigation-screen');

  static const String name = 'BottomNavigationRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup-screen');

  static const String name = 'SignupRoute';
}

class NotificationRoute extends _i1.PageRouteInfo {
  const NotificationRoute() : super(name, path: '/notification-screen');

  static const String name = 'NotificationRoute';
}

class AdminDashboardRoute extends _i1.PageRouteInfo {
  const AdminDashboardRoute() : super(name, path: '/admin-dashboard-screen');

  static const String name = 'AdminDashboardRoute';
}

class DestinationRoute extends _i1.PageRouteInfo {
  const DestinationRoute() : super(name, path: '/destination-screen');

  static const String name = 'DestinationRoute';
}

class UserListRoute extends _i1.PageRouteInfo {
  const UserListRoute() : super(name, path: '/user-list-screen');

  static const String name = 'UserListRoute';
}
