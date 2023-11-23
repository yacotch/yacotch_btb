import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/call_kit_param.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/navigator.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/payload_extractor.dart';
import 'package:trainee_restaurantapp/features/trainer/notification/data/repositories/notification_repo.dart';
import 'package:trainee_restaurantapp/features/trainer/notification/presentation/controller/notification_cubit.dart';
import 'package:trainee_restaurantapp/main.dart';

void showCallNotification(String payload) {
  FlutterCallkitIncoming.showCallkitIncoming(callKitParams(
      name: PayLoadDataExtractor.getSenderName(payload),
      type: PayLoadDataExtractor.getMsgType(payload)));
  FlutterCallkitIncoming.onEvent.listen((event) async {
    if (event!.event == Event.ACTION_CALL_DECLINE) {
      _sendCancelNotification(payload);
    } else if (event.event == Event.ACTION_CALL_CALLBACK) {
      _callBack(payload);
    } else if (event.event == Event.ACTION_CALL_ACCEPT) {
      if (_isVideo(payload)) {
        await CallsNavigator.goToVideoCallScreen(payload);
      } else {
        await CallsNavigator.goToVideoCallScreen(payload);
      }
    }
  });
}

bool _isVideo(String payload) => PayLoadDataExtractor.getMsgType(payload) == 1;

void _callBack(String payload) async {
  await NotificationRepo().createNotification(
      PayLoadDataExtractor.getSenderId(payload),
      PayLoadDataExtractor.getMsgType(payload),
      PayLoadDataExtractor.getChannelName(payload));
  _isVideo(payload)
      ? await CallsNavigator.goToVideoCallScreen(payload)
      : await CallsNavigator.goToVoiceCallScreen(payload);
}

void _sendCancelNotification(String payload) {
  NotificationRepo().createNotification(
      PayLoadDataExtractor.getSenderId(payload), -0, "cancel_call");
}
