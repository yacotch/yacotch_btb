import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/models/subscription_model.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../subscription/presentation/view/subscription_screen.dart';

Widget trainerBouquet(int userType) {
  return BlocBuilder<TrainerProfileCubit, TrainerProfileState>(
    builder: (context, state) {
      TrainerProfileCubit.of(context).trainerModel!.subscription =
          SubscriptionModel(name: "subscription");
      if (TrainerProfileCubit.of(context).trainerModel != null) {
        if (TrainerProfileCubit.of(context).trainerModel!.subscription !=
            null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100.h,
              child: Column(
                children: [
                  TitleWidget(
                    title: LanguageHelper.getTranslation(context)
                        .subscription_plan,
                    subtitleColorTapped: () {},
                    subtitle: "",
                    titleColor: AppColors.accentColorLight,
                  ),
                  Gaps.vGap14,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppConstants.borderRadius10)),
                                gradient: const LinearGradient(colors: [
                                  AppColors.lightColor,
                                  AppColors.accentColorLight
                                ])),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: TrainerProfileCubit.of(context)
                                                .trainerModel!
                                                .subscription ==
                                            null
                                        ? ''
                                        : TrainerProfileCubit.of(context)
                                                .trainerModel!
                                                .subscription!
                                                .name ??
                                            "",
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    fontSize: AppConstants.textSize16,
                                  ),
                                  CustomText(
                                    text:
                                        "${TrainerProfileCubit.of(context).trainerModel?.subscription!.fee ?? 0} ${Translation.of(context).saudi_riyal}",
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    fontSize: AppConstants.textSize16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gaps.hGap16,
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        AppColors.transparent.withOpacity(0.2)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppConstants.blurDegree10)),
                                gradient: LinearGradient(colors: [
                                  AppColors.transparent.withOpacity(0.0),
                                  AppColors.transparent.withOpacity(0.5)
                                ])),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  NavigationHelper.goto(
                                      screen: SubscriptionScreen(
                                          typeUser: userType),
                                      context: context);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      } else {
        return const SizedBox();
      }
    },
  );
}
