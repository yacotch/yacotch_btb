import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';

class EditTrainerProfileImageWidget extends StatelessWidget {
  const EditTrainerProfileImageWidget({
    required this.file,
    required this.imageNetwork,
    super.key,
  });
  final File file;
  final String imageNetwork;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerProfileCubit, TrainerProfileState>(
      buildWhen: (previous, current) => current is GetImageState,
      builder: (context, state) {
        return Container(
          height: 0.52.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
            image: file.path.isNotEmpty
                ? DecorationImage(image: FileImage(file), fit: BoxFit.cover)
                : imageNetwork == ''
                    ? const DecorationImage(
                        image: AssetImage(AppConstants.AVATER_IMG),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(imageNetwork ?? ''),
                        fit: BoxFit.cover),
          ),
          child: Container(
            color: AppColors.primaryColorLight.withOpacity(0.7),
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  await TrainerProfileCubit.of(context).getImage();
                  TrainerProfileCubit.of(context).emit(GetImageState());
                },
                child: ImageIcon(
                  const AssetImage(AppConstants.CAMERA_ICON),
                  color: AppColors.white,
                  size: 104.w,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
