import "dart:developer";

import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:flutter_callkit_incoming/flutter_callkit_incoming.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:trainee_restaurantapp/core/notifications/calls/show.dart";
import "package:trainee_restaurantapp/core/notifications/init_local_notification.dart";
import "package:trainee_restaurantapp/core/notifications/onmessage_listener.dart";
import "package:trainee_restaurantapp/core/notifications/permissions.dart";
import "package:trainee_restaurantapp/core/ui/toast.dart";
import "package:trainee_restaurantapp/main.dart";

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setupNotifications() {
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
    handleOnMessageListener(event);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) async {
    handleOnMessageListener(event);
  });
}

@pragma("vm:entry-point")
Future<void> handleBackGround(message) async {
  //save the state before the call be shown to the user and app may change the state
  //if the user click on it
  AppLifecycleState? latestState = WidgetsBinding.instance.lifecycleState;
  print("latest state $latestState");
  print("${latestState != null && latestState == AppLifecycleState.detached}");
  handleOnMessageListener(message);

  if (latestState != null && latestState != AppLifecycleState.detached) {
    Toast.show("background");
    FlutterCallkitIncoming.onEvent.listen((event) {
      handleCallKitResponseForBackground(event);
    });
  }
}
