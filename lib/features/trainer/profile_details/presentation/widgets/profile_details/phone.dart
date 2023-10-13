import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';

class TrainerPhoneWidget extends StatelessWidget {
  const TrainerPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.w, 0, 8.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const FaIcon(
            FontAwesomeIcons.phone,
            color: AppColors.accentColorLight,
            size: 14,
          ),
          Gaps.hGap8,
          CustomText(
            text:
                TrainerProfileCubit.of(context).trainerModel!.phoneNumber ?? "",
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontSize: AppConstants.textSize14,
          ),
        ],
      ),
    );
  }
}
