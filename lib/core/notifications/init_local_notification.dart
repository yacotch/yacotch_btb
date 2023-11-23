import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trainee_restaurantapp/core/notifications/handle_tap.dart';
import 'package:trainee_restaurantapp/core/notifications/notification_service.dart';

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    //    onDidReceiveNotificationResponse: (payload) {
    //  handleNotificationsTap(payload);
    //}, onDidReceiveBackgroundNotificationResponse: handleBackGround
  );
}
