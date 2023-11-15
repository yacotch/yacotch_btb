import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:trainee_restaurantapp/core/notifications/init_local_notification.dart";
import "package:trainee_restaurantapp/core/notifications/onmessage_listener.dart";
import "package:trainee_restaurantapp/core/notifications/permissions.dart";

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setupNotifications() {
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onMessage
      .listen((RemoteMessage event) async => handleOnMessageListener(event));
}

@pragma("vm:entry-point")
Future<void> handleBackGround(message) async {
  print("in back ground ");
  //show the notification with accept & cancel options
  handleOnMessageListener(message);
}
