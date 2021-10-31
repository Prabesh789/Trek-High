import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/presentation/my_app/my_app.dart';
import 'package:trek_high/app_setup/app_init/app_init.dart';

Future initializeApp() async {
  await AppInit.initialize();
  runApp(
    EasyLocalization(
      path: 'assets/translation',
      supportedLocales: const [
        Locale('en'),
        Locale('ne', 'NP'),
      ],
      fallbackLocale: const Locale('ne', 'NP'),
      useFallbackTranslations: true,
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
