import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class TrainerExperiencePDFSWidget extends StatelessWidget {
  const TrainerExperiencePDFSWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>? files =
        TrainerProfileCubit.of(context).trainerModel!.experienceFiles;
    hasExperience() => files != null && files.isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: Translation.of(context).myFiles,
          color: AppColors.accentColorLight,
          fontSize: AppConstants.textSize14,
          fontWeight: FontWeight.w700,
        ),
        !hasExperience()
            ? CustomText(
                text: Translation.of(context).no_data_found,
                color: AppColors.lightGrey,
                fontSize: AppConstants.textSize14,
                fontWeight: FontWeight.w700,
              )
            : Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: files?.length,
                    itemBuilder: (context, index) => CustomText(
                          text:
                              "${LanguageHelper.getTranslation(context).experienceCertification} ${index + 1}",
                          color: AppColors.lightGrey,
                          fontSize: AppConstants.textSize14,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.end,
                        )),
              ),
      ],
    );
  }
}
