import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/notification/presentation/controller/notification_cubit.dart';
class VoiceCallIcon extends StatelessWidget {
  final int id;
  final String channelName;
  const VoiceCallIcon(this.id, this.channelName, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _sendNotification(context);
          _goToVoiceCallScreen(context);
        },
        icon: const Icon(
          Icons.phone,
          color: AppColors.accentColorLight,
        ));
  }

  void _goToVoiceCallScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VoiceCallScreen(id, channelName)));
  }

  void _sendNotification(BuildContext context) {
    BlocProvider.of<NotificationCubit>(context)
        .createNotifications(id, 2, channelName);
  }
}
