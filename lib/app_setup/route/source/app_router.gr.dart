// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../features/auth/login_screen/login_screen.dart' as _i5;
import '../../../features/auth/sign_screen/sign_up_screen.dart' as _i6;
import '../../../features/landing_screen/landing_screen.dart' as _i3;
import '../../../features/main_dashboard/presentation/main_dashboard_screen.dart'
    as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i3.LandingScreen();
        }),
    MainDashboardRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i4.MainDashboardScreen();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i5.LoginScreen();
        }),
    SignupRoute.name: (routeData) => _i1.MaterialPageX<void>(
        routeData: routeData,
        builder: (_) {
          return const _i6.SignupScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingRoute.name, path: '/'),
        _i1.RouteConfig(MainDashboardRoute.name,
            path: '/main-dashboard-screen'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i1.RouteConfig(SignupRoute.name, path: '/signup-screen')
      ];
}

class LandingRoute extends _i1.PageRouteInfo {
  const LandingRoute() : super(name, path: '/');

  static const String name = 'LandingRoute';
}

class MainDashboardRoute extends _i1.PageRouteInfo {
  const MainDashboardRoute() : super(name, path: '/main-dashboard-screen');

  static const String name = 'MainDashboardRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup-screen');

  static const String name = 'SignupRoute';
}
