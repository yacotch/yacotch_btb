import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/video_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';
import 'package:trainee_restaurantapp/main.dart';

Future<void> handleNotificationsTap(NotificationResponse? payload) async {
  print('payload is ${payload?.actionId} ${payload?.id} ${payload?.input}');
  print("id ${payload?.payload}");
  if (payload?.input == 'Accept') {
    print("user clicked on accept button");
    if (_isVideoCall(payload)) {
      await _goToVideoCallScreen(payload);
    } else if (_isAudioCall(payload)) {
      await _goToVoiceCallScreen(payload);
    }
    _hideNotification(payload);
  } else {
    _hideNotification(payload);
  }
}

Future<void> _goToVideoCallScreen(NotificationResponse? payload) async =>
    await NavigationHelper.goto(
        screen: VideoCallScreen(
            _getRemoteUserId(payload), _getChannelName(payload)),
        context: navigatorKey.currentState!.context);

Future<void> _goToVoiceCallScreen(NotificationResponse? payload) async =>
    await NavigationHelper.goto(
        screen: VoiceCallScreen(
            _getRemoteUserId(payload), _getChannelName(payload),remoteName: gettra),
        context: navigatorKey.currentState!.context);

void _hideNotification(NotificationResponse? payload) {
  FlutterLocalNotificationsPlugin().cancel(payload!.id!);
}

bool _isMessage(NotificationResponse? payload) => _getMessageType(payload) == 0;
bool _isVideoCall(NotificationResponse? payload) =>
    _getMessageType(payload) == 1;
bool _isAudioCall(NotificationResponse? payload) =>
    _getMessageType(payload) == 2;

int _getMessageType(NotificationResponse? payload) {
  return int.parse(payload!.payload!
      .split(',')
      .firstWhere((element) => element.contains('MsgType'))
      .replaceAll("MsgType:", '')
      .trim());
}

int _getRemoteUserId(NotificationResponse? payload) {
  return int.parse(payload!.payload!
      .split(',')
      .firstWhere((element) => element.contains('SenderId'))
      .replaceAll("SenderId:", '')
      .trim());
}

String _getChannelName(NotificationResponse? payload) {
  return payload!.payload!
      .split(',')
      .firstWhere((element) => element.contains('HiddenData'))
      .replaceAll("{HiddenData:", '')
      .trim();
}
