import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/profile_view_screen.dart';

abstract class EditTrainerProfileFunctions {
  static void initailzeControllers(BuildContext context) {
    TrainerProfileCubit.of(context).networkImageUrl =
        TrainerProfileCubit.of(context).trainerModel!.imageUrl ?? '';
    TrainerProfileCubit.of(context).nameController.text =
        TrainerProfileCubit.of(context).trainerModel!.name ?? '';
    TrainerProfileCubit.of(context).phoneController.text =
        TrainerProfileCubit.of(context).trainerModel!.phoneNumber ?? '';
    TrainerProfileCubit.of(context).idNumberController.text =
        TrainerProfileCubit.of(context)
            .trainerModel!
            .specializationId
            .toString();
    TrainerProfileCubit.of(context).hourRateController.text =
        (TrainerProfileCubit.of(context).trainerModel!.hourPrice ?? 0)
            .toString();
    TrainerProfileCubit.of(context).coachSpecializationController.text =
        TrainerProfileCubit.of(context).trainerModel!.specialization!.text ??
            '';
    TrainerProfileCubit.of(context).networkCvUrl =
        TrainerProfileCubit.of(context).trainerModel!.cvUrl ?? '';

    TrainerProfileCubit.of(context).latitude =
        TrainerProfileCubit.of(context).trainerModel!.latitude ?? 0;

    TrainerProfileCubit.of(context).longitude =
        TrainerProfileCubit.of(context).trainerModel!.longitude ?? 0;
  }
  static  Future<void> updateProfile(BuildContext context) async {
    await TrainerProfileCubit.of(context).getTrainerProfile(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ProfileTrainerScreenView(),
    ));
  }
}
