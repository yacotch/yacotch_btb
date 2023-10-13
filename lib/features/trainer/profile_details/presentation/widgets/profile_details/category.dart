import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';

class TrainerCatgoryWidget extends StatelessWidget {
  const TrainerCatgoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text:
          TrainerProfileCubit.of(context).trainerModel!.specialization!.text ??
              "",
      fontWeight: FontWeight.w600,
      color: AppColors.white,
      fontSize: AppConstants.textSize14,
    );
  }
}
