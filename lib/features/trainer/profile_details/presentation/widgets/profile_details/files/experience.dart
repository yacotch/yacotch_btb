import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/clicked_file.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/functions.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class TrainerExperiencePDFSWidget extends StatelessWidget {
  const TrainerExperiencePDFSWidget({super.key});

  @override
  Widget build(BuildContext context) {
    hasExperience() =>
        TrainerProfileCubit.of(context).trainerModel!.experienceFiles != null &&
        TrainerProfileCubit.of(context)
            .trainerModel!
            .experienceFiles!
            .isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: Translation.of(context).myFiles,
          color: AppColors.accentColorLight,
          fontSize: AppConstants.textSize14,
          fontWeight: FontWeight.w700,
        ),
        TrainerProfileCubit.of(context).trainerModel!.experienceFiles == null
            ? CustomText(
                text: Translation.of(context).no_data_found,
                color: AppColors.lightGrey,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.w700,
              )
            : ClickedFileWidget(
                onTap: hasExperience()
                    ? () => openFileInNewScreen(
                          context,
                          TrainerProfileCubit.of(context)
                              .trainerModel!
                              .experienceFiles!
                              .first,
                        )
                    : null,
                text: hasExperience()
                    ? getImageName(
                        TrainerProfileCubit.of(context)
                            .trainerModel!
                            .experienceFiles!
                            .first,
                      )
                    : null,
              )
        /*         ListView.builder(
                itemCount: TrainerProfileCubit.of(context)
                    .trainerModel!
                    .experienceFiles
                    ?.length,
                itemBuilder: (context, index) => CustomText(
                      text: TrainerProfileCubit.of(context)
                          .trainerModel!
                          .experienceFiles![index],
                      color: AppColors.lightGrey,
                      fontSize: AppConstants.textSize14,
                      fontWeight: FontWeight.w700,
                    )),
   */
      ],
    );
  }
}
