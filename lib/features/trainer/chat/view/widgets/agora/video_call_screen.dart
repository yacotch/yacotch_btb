import 'dart:async';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'agoraConfig.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    appId: AgoraConstants.appId,
    channelName: "esraaabdrabo23",
    tempToken:
        "007eJxTYPjN8z7cPelE3DVnj3lVe+xdTHsfsOafzj/HWTfvpJb0ubMKDCmGKalJZkmJiZYGxiaWiYaWqWamZsZmxiZGlokGialGnpEqqQ2BjAwX9k9gZGSAQBCfjyG1uCgxMTEppSgxKd/ImIEBAKqvIvY=",
  ));

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: const TransparentAppBar(
            title: "chat",
          ),
          body: SafeArea(
            child: Stack(
              children: [
                AgoraVideoViewer(
                  client: _client,
                  layoutType: Layout.floating,
                  showNumberOfUsers: true,
                ),
                AgoraVideoButtons(
                  client: _client,
                  enabledButtons: const [
                    BuiltInButtons.toggleCamera,
                    BuiltInButtons.switchCamera,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.toggleMic,
                  ],
                )
              ],
            ),
          )),
    );
  }
}
