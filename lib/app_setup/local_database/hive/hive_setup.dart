import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trek_high/app_setup/local_database/hive/hive_const.dart';
import 'package:trek_high/features/infrastructure/entities/response/auth_token/auth_token.dart';

class HiveSetup {
  HiveSetup._();

  static Future get initHive => _initHive();

  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(AuthTokenAdapter());
  }
}

Future<void> clearHive() async {
  await Hive.deleteBoxFromDisk(hiveTokenBox);
  debugPrint('Local Database Cleared');
}

Future<LazyBox> openBox(String name) async {
  return Hive.isBoxOpen(name)
      ? Hive.lazyBox(name)
      : await Hive.openLazyBox(name);
}
