import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/app_setup/firebae_notification_service/firebase_notification_service.dart';

import 'package:trek_high/app_setup/local_database/hive/hive_setup.dart';

//Receive message when the app is in background
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  // ignore: avoid_print
  print(message.data.toString());
  // ignore: avoid_print
  print(message.notification!.title);
}

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    FirebaseNotificationService.initialize();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();

    await HiveSetup.initHive;
    await FirebaseMessaging.instance.requestPermission();
  }
}
