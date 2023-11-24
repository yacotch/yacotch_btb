import 'package:flutter/material.dart';

class MyAppStateObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    // Handle state changes (resumed, inactive, paused, etc.)
    if (state == AppLifecycleState.resumed) {
      // App is in the foreground
    } else if (state == AppLifecycleState.inactive) {
      // App is in an inactive state
    } else if (state == AppLifecycleState.paused) {
      // App is in the background
    } else if (state == AppLifecycleState.detached) {
      // App is terminated
    }
  }
}
