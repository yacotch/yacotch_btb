import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/dimens.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/view/home_trainer_view.dart';
import 'package:trainee_restaurantapp/features/trainer/notification/presentation/view/notification_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/profile_view_screen.dart';

Widget trainerProfile() {
  return BlocBuilder<TrainerProfileCubit, TrainerProfileState>(
    buildWhen: (previous, current) => previous != current,
    builder: (context, state) {
      if (state is GetTrainerProfileLoading) {
        return const Loader();
      } else {
        var trainerModel = TrainerProfileCubit.of(context).trainerModel;
        return InkWell(
          onTap: () => NavigationHelper.goto(
              screen: const ProfileTrainerScreenView(), context: context),
          child: Container(
            height: 192.h,
            decoration: const BoxDecoration(
              color: AppColors.darkBrownColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimens.dp10),
                  bottomRight: Radius.circular(Dimens.dp10)),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrainerProfileImageWidget(trainerModel: trainerModel),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 23.0, left: 23, right: 23),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: trainerModel!.name ?? "",
                            fontSize: Dimens.dp20,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          if (trainerModel.subscription != null)
                            CustomText(
                              text: trainerModel.subscription!.name ?? "",
                              fontSize: Dimens.dp20,
                              color: AppColors.accentColorLight,
                              fontWeight: FontWeight.w700,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () => NavigationHelper.goto(
                            screen: const NotificationScreen(),
                            context: context),
                        icon: const FaIcon(
                          FontAwesomeIcons.solidBell,
                          color: AppColors.white,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      }
    },
  );
}
