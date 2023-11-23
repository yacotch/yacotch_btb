import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/payload_extractor.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/video_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';
import 'package:trainee_restaurantapp/main.dart';

abstract class CallsNavigator {
  static Future<void> goToVideoCallScreen(String? payload) async =>
      NavigationHelper.goto(
          screen: VideoCallScreen(PayLoadDataExtractor.getSenderId("$payload"),
              PayLoadDataExtractor.getChannelName("$payload"),
              remoteName: PayLoadDataExtractor.getSenderName("$payload")),
          context: navigatorKey.currentContext!);
  static Future<void> goToVoiceCallScreen(String? payload) async =>
      NavigationHelper.goto(
          screen: VoiceCallScreen(PayLoadDataExtractor.getSenderId("$payload"),
              PayLoadDataExtractor.getChannelName("$payload"),
              remoteName: PayLoadDataExtractor.getSenderName("$payload")),
          context: navigatorKey.currentContext!);
}
