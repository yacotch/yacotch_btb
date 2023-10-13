import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class TrainerHourPriceWidget extends StatelessWidget {
  const TrainerHourPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
        text:
            "${TrainerProfileCubit.of(context).trainerModel!.hourPrice ?? 0} ${Translation.of(context).pricePerHour}",
        fontWeight: FontWeight.w600,
        color: AppColors.accentColorLight,
        fontSize: AppConstants.textSize12);
  }
}
