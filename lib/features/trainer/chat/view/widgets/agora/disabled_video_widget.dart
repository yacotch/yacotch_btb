import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/functions.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';

class DisabledVideoWidget extends StatelessWidget {
  final AgoraClient client;
  const DisabledVideoWidget(this.client, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //give the entire width to the outer widget to make the number of users widget in the same
      //place whether the video is disabled or not
      width: 1.sw,
      child: SizedBox(
        width: .5.sw,
        child: Center(
          child: Text(
            AgoraFunctions.isLocalDisabledVideo(client)
                ? _getMyName(context)
                : "remote",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}

String _getMyName(BuildContext context) {
  return BlocProvider.of<TrainerProfileCubit>(context).trainerModel!.name!;
}
