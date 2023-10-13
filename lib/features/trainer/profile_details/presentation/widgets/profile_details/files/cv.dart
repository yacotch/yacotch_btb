import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/clicked_file.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/functions.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class TrainerCVwidget extends StatelessWidget {
  const TrainerCVwidget({super.key});

  @override
  Widget build(BuildContext context) {
    hasCv() => TrainerProfileCubit.of(context).trainerModel!.cvUrl != null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: Translation.of(context).cv,
          color: AppColors.accentColorLight,
          fontSize: AppConstants.textSize14,
          fontWeight: FontWeight.w700,
        ),
        ClickedFileWidget(
          onTap: hasCv()
              ? () => openFileInNewScreen(
                    context,
                    TrainerProfileCubit.of(context).trainerModel!.cvUrl!,
                  )
              : null,
          text: hasCv()
              ? getImageName(
                  TrainerProfileCubit.of(context).trainerModel!.cvUrl!,
                )
              : null,
        )
      ],
    );
  }
}
