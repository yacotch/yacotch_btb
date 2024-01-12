import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/profile_view_screen.dart';

abstract class EditTrainerProfileFunctions {
  static void initailzeControllers(BuildContext context) {
    var cubit = TrainerProfileCubit.of(context);
    cubit.networkImageUrl = cubit.trainerModel!.imageUrl ?? '';

    cubit.nameController.text = cubit.trainerModel!.name ?? '';
    cubit.phoneController.text = cubit.trainerModel!.phoneNumber ?? '';
    cubit.idNumberController.text =
        cubit.trainerModel!.specializationId.toString();
    cubit.hourRateController.text =
        (cubit.trainerModel!.hourPrice ?? 0).toString();
    cubit.coachSpecializationController.text =
        cubit.trainerModel!.specialization!.text ?? '';
    cubit.networkCvUrl = cubit.trainerModel!.cvUrl ?? '';

    cubit.latitude = cubit.trainerModel!.latitude ?? 0;

    cubit.longitude = cubit.trainerModel!.longitude ?? 0;
  }

  static Future<void> updateProfile(BuildContext context) async {
    await TrainerProfileCubit.of(context).getTrainerProfile(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ProfileTrainerScreenView(),
    ));
  }
}
