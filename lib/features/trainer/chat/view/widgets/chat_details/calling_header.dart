import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/data/model/chat_model.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/video_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';
import 'package:trainee_restaurantapp/features/trainer/notification/presentation/controller/notification_cubit.dart';

class ClallingHeaderWidget extends StatelessWidget {
  final ChatModel chatModel;
  const ClallingHeaderWidget({required this.chatModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.transparent.withOpacity(0.1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .5,
            child: CustomText(
              text: chatModel.traineeName ?? "",
              fontWeight: FontWeight.w700,
              fontSize: AppConstants.textSize18,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(chatModel.traineeImage == null ||
                        chatModel.traineeImage!.isEmpty
                    ? defaultAvatar
                    : chatModel.traineeImage!),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => NotificationCubit(),
            child: BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
              return Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => _goToVoiceCallScreen(context),
                      icon: const Icon(
                        Icons.phone,
                        color: AppColors.accentColorLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 1.h,
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _goToVideoCallScreen(context),
                      icon: const Icon(
                        Icons.video_call,
                        color: AppColors.accentColorLight,
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  void _goToVoiceCallScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return VoiceCallScreen(chatModel.traineeId, _getChannelName,
              remoteName: chatModel.traineeName!);
        },
      ),
    );
    _sendNotification(context, 2);
  }

  void _goToVideoCallScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return VideoCallScreen(chatModel.trainerId, _getChannelName,
          remoteName: chatModel.traineeName!);
    }));
    _sendNotification(context, 1);
  }

  void _sendNotification(BuildContext context, int type) =>
      BlocProvider.of<NotificationCubit>(context)
          .createNotifications(chatModel.traineeId!, type, _getChannelName);

  String get _getChannelName => "${chatModel.traineeId}${chatModel.trainerId}";
}
