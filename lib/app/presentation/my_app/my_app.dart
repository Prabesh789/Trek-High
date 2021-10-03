import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/theme/application/theme_controller.dart';

class MyApp extends StatefulHookWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read(themeController.notifier).fetchTheme();
    super.initState();
  }

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final theme = useProvider(themeController);
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Trek High',
      theme: theme,
      themeMode: theme.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
