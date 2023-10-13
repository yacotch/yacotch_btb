import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/main_information.dart';

class TrainerInformationsCard extends StatelessWidget {
  const TrainerInformationsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          //user profile image
          image: TrainerProfileCubit.of(context).trainerModel!.imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(
                      TrainerProfileCubit.of(context).trainerModel!.imageUrl!),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage(AppConstants.AVATER_IMG),
                ),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 130.h,
            child: const TrainerMainInformationsWidget(),
          ),
        ),
      ),
    );
  }
}
