import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/profile_view_screen.dart';

abstract class EditTrainerProfileFunctions {
  static void initailzeControllers(BuildContext context) {
    var cubit = TrainerProfileCubit.of(context);
    var trainer = cubit.trainerModel!;
    cubit.networkImageUrl = trainer.imageUrl ?? '';
    cubit.nameController.text = trainer.name ?? '';
    cubit.phoneController.text = trainer.phoneNumber ?? '';
    cubit.idNumberController.text = trainer.specializationId.toString();
    cubit.hourRateController.text = (trainer.hourPrice ?? 0).toString();
    cubit.coachSpecializationController.text =
        trainer.specialization!.text ?? '';
    cubit.networkCvUrl = trainer.cvUrl ?? '';
    cubit.oldExperienceFilesUrls = trainer.experienceFiles;
    cubit.latitude = trainer.latitude ?? 0;

    cubit.longitude = trainer.longitude ?? 0;
  }

  static Future<void> updateProfile(BuildContext context) async {
    await TrainerProfileCubit.of(context).getTrainerProfile(context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ProfileTrainerScreenView(),
    ));
  }
}
