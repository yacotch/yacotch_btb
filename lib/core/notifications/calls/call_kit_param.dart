import 'package:flutter_callkit_incoming/entities/entities.dart';

var videoCallIcon =
    "https://hmn-assets-2.ams3.cdn.digitaloceanspaces.com/ef5f865e-0749-4f4b-9d49-62adb21f6aad/wcap512.png";
var voiceCallIcon =
    "https://www.total-tam.com.tw/archive/image/RWDBASE_PAT01311/telephone.png";
bool isVoiceCall(int type) => type == 2;
CallKitParams callKitParams({required String name, required int type}) =>
    CallKitParams(
      id: "1",
      nameCaller: '$name is calling you.',
      appName: 'Yacotch',
      avatar: isVoiceCall(type) ? voiceCallIcon : videoCallIcon,
      handle:
          'It\'s a ${isVoiceCall(type) ? "voice" : "video"} call for now. Pick up when you\'re ready!',
      textAccept: 'Accept',
      textDecline: 'Decline',
      textMissedCall: "mised call",
      duration: 10000,
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: true,
        isShowMissedCallNotification: true,
        isShowCallback: true,
        ringtonePath: 'system_ringtone_default',

        backgroundColor: '#0955fa',
        // backgroundUrl: voiceCallIcon,
        actionColor: '#4CAF50',
        incomingCallNotificationChannelName: "Incoming Call",
        missedCallNotificationChannelName: "Missed Call",
      ),
      ios: IOSParams(
        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 2,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: true,
        supportsHolding: true,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );
