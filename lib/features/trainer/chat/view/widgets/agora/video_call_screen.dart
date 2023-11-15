import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/disable_video.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/end_call.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/mute.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/buttons/switch_camera.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/disabled_video_widget.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/functions.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora_loading.dart';
import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  static const String routeName = "/VideoScreen";

  final int? remoterUserId;
  final String channelName;
  const VideoCallScreen(this.remoterUserId, this.channelName, {Key? key})
      : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? _client;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initAgora() async {
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConstants.appId,
        channelName: widget.channelName,
        tempToken: await AgoraFunctions.getToken(widget.channelName),
      ),
    );
    await _client?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initAgora(),
        builder: (context, snapShot) => AgoraFunctions.isInitLoading(snapShot)
            ? const AgoraLoadingBody()
            : WillPopScope(
                onWillPop: () async {
                  _client!.release();
                  return true;
                },
                child: Scaffold(
                    body: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    AgoraVideoViewer(
                      client: _client!,
                      disabledVideoWidget: DisabledVideoWidget(_client!),
                      layoutType: Layout.floating,
                      showNumberOfUsers: true,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      EndCallButton(_client!),
                      DisableVideoButton(_client!),
                      SwitchCameraButton(_client!),
                      MuteVoiceButton(client: _client),
                    ]),
                  ],
                )),
              ));
  }
}
