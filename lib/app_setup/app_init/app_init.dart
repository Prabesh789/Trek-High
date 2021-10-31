import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:trek_high/app_setup/local_database/hive/hive_setup.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();

    await HiveSetup.initHive;
    await FirebaseMessaging.instance.requestPermission();
    // await FirebaseNotificationsService.instance.init();
    // await initFirebaseMessaging();
  }

  // static Future<void> initFirebaseMessaging() async {
  //   final localDatabaseContainer = ProviderContainer();
  //   final localDb = localDatabaseContainer.read(localDataSource);
  //   await FirebaseNotificationsService()
  //       .firebaseMessaging
  //       .getToken()
  //       .then((token) async {
  //     final value = await localDb.getToken();
  //     await localDb.cacheToken(
  //       AuthToken(
  //         authToken: value?.authToken,
  //         fcmToken: token,
  //       ),
  //     );
  //     return token;
  //   });
  // }

}
