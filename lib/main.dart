import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app/presentation/my_app/my_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
