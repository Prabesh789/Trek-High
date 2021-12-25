import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  static final FlutterLocalNotificationsPlugin _noticationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _noticationPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecondsSinceEpoch ~/ 100;
      const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'trek-high',
          'trek-high',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      await _noticationPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
