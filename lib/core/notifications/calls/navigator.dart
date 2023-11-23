import 'package:trainee_restaurantapp/core/navigation/navigation_service.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/payload_extractor.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/video_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';

abstract class CallsNavigator {
  static Future<void> goToVideoCallScreen(String? payload) async =>
      await NavigationService().navigateTo(VideoCallScreen.routeName,
          arguments: (PayLoadDataExtractor.getChannelNameAndId(payload)));

  static Future<void> goToVoiceCallScreen(String? payload) async =>
      await NavigationService().navigateTo(VoiceCallScreen.routeName,
          arguments: (PayLoadDataExtractor.getChannelNameAndId(payload)));
}
