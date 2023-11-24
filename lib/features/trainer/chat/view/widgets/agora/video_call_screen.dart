import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/toast.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/disable_video.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/end_call.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/mute.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/switch_camera.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/disabled_video_widget.dart';

import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  static const String routeName = "/VideoScreen";

  final int? senderId;
  final String channelName;
  final String remoteName;

  const VideoCallScreen(this.senderId, this.channelName,
      {required this.remoteName, Key? key})
      : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? _client;
  StreamSubscription<RemoteMessage>? notificationsListner;
  @override
  //test cases
  //from btb make video call to trainee
  //from trainee cancel the call
  //expected => btb call notificationsListner in init state because the trainee will
  //send cancel notification
  void initState() {
    super.initState();
    _initAgora();
    notificationsListner = FirebaseMessaging.onMessage.listen((event) async {
      Toast.show(
          "event id 315 :  ${event.data['SenderId']} \n widget sender id 220 : ${widget.senderId}");
      if (_wannaCancel(event)) {
        Toast.show(LanguageHelper.getTranslation(context)
            .the_member_decline_the_call(widget.remoteName));
        Navigator.pop(context);
        await _client!.release();
        notificationsListner?.cancel();
      }
    });
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
      agoraRtmChannelEventHandler:
          AgoraRtmChannelEventHandler(onMemberLeft: (_) {
        //show the user that the remote user left the group
        _handleMemberLeft();
      }),
      agoraConnectionData: AgoraConnectionData(
        rtmChannelName: widget.channelName,
        appId: AgoraConstants.appId,
        channelName: widget.channelName,
      ),
    );
    await _client?.initialize();
  }

  bool _wannaCancel(RemoteMessage event) {
    return event.data['MsgType'] == "-1" &&
        event.data['SenderId'] == "${widget.senderId}";
  }

  void _handleMemberLeft() async {
    //show the user that the remote user left the group
    Toast.show(LanguageHelper.getTranslation(context)
        .the_member_left_the_call(widget.remoteName));
    await Future.delayed(const Duration(milliseconds: 500));
    context.mounted ? Navigator.pop(context) : null;
    _endCall();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _endCall();
        return true;
      },
      child: Scaffold(
          body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          AgoraVideoViewer(
            client: _client!,
            disabledVideoWidget:
                DisabledVideoWidget(_client!, remoteName: widget.remoteName),
            layoutType: Layout.grid,
            showNumberOfUsers: true,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            EndCallButton(_client!, widget.senderId!),
            DisableVideoButton(_client!),
            SwitchCameraButton(_client!),
            MuteVoiceButton(client: _client),
          ]),
        ],
      )),
    );
  }

  void _endCall() {
    _client!.release();
  }
}
