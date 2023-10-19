import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/models/new_trainee_model.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/navigation/route_generator.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';
import 'package:trainee_restaurantapp/features/trainer/trainee/presentation/view/all_trainee_screen.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';

Widget imageWithNameTrainee(NewTraineeModel newTraineeModel) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
      image: DecorationImage(
        image: NetworkImage(newTraineeModel.trainee!.imageUrl ?? defaultAvatar),
        fit: BoxFit.cover,
      ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 35.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlurWidget(
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: CustomText(
                      text: newTraineeModel.trainee!.name ?? "",
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: AppConstants.textSize16,
                    ),
                  ),
                  Gaps.hGap4,
                  Container(
                    color: AppColors.accentColorLight,
                    height: 7.h,
                    width: 101.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildNewTraineesSection() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 300.h,
      child: BlocBuilder<HomeTrainerCubit, HomeTrainerState>(
        builder: (context, state) {
          if (HomeTrainerCubit.of(context).newTrainees != null) {
            if (HomeTrainerCubit.of(context).newTrainees!.isNotEmpty) {
              return Column(
                children: [
                  TitleWidget(
                    title: LanguageHelper.getTranslation(context).new_trainees,
                    subtitleColorTapped: () {
                      NavigationHelper.goto(
                          screen: AllTraineeScreen(), context: context);
                    },
                    subtitle:
                        HomeTrainerCubit.of(context).newTrainees!.isNotEmpty
                            ? Translation.of(context).see_all
                            : null,
                    titleColor: AppColors.accentColorLight,
                  ),
                  Gaps.vGap14,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (HomeTrainerCubit.of(context)
                                  .newTrainees!
                                  .isNotEmpty)
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (HomeTrainerCubit.of(context)
                                          .newTrainees!
                                          .isNotEmpty)
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                Routes.traineeProfileScreen,
                                                arguments: {
                                                  "courseId":
                                                      HomeTrainerCubit.of(
                                                              context)
                                                          .newTrainees!
                                                          .first
                                                          .course!
                                                          .value,
                                                  "traineeId":
                                                      HomeTrainerCubit.of(
                                                              context)
                                                          .newTrainees!
                                                          .first
                                                          .trainee!
                                                          .id
                                                });
                                          },
                                          child: imageWithNameTrainee(
                                              HomeTrainerCubit.of(context)
                                                  .newTrainees!
                                                  .first),
                                        )),
                                      SizedBox(
                                        height: 8.w,
                                      ),
                                      if (HomeTrainerCubit.of(context)
                                              .newTrainees!
                                              .length >
                                          1)
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                Routes.traineeProfileScreen,
                                                arguments: {
                                                  "courseId":
                                                      HomeTrainerCubit.of(
                                                              context)
                                                          .newTrainees![1]
                                                          .course!
                                                          .value,
                                                  "traineeId":
                                                      HomeTrainerCubit.of(
                                                              context)
                                                          .newTrainees![1]
                                                          .trainee!
                                                          .id
                                                });
                                          },
                                          child: imageWithNameTrainee(
                                              HomeTrainerCubit.of(context)
                                                  .newTrainees![1]),
                                        ))
                                    ],
                                  ),
                                ),
                              SizedBox(width: 8.w),
                              if (HomeTrainerCubit.of(context)
                                      .newTrainees!
                                      .length >
                                  2)
                                Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              Routes.traineeProfileScreen,
                                              arguments: {
                                                "courseId":
                                                    HomeTrainerCubit.of(context)
                                                        .newTrainees![2]
                                                        .course!
                                                        .value,
                                                "traineeId":
                                                    HomeTrainerCubit.of(context)
                                                        .newTrainees![2]
                                                        .trainee!
                                                        .id
                                              });
                                        },
                                        child: imageWithNameTrainee(
                                            HomeTrainerCubit.of(context)
                                                .newTrainees![2]))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(LanguageHelper.getTranslation(context).no_trainees),
              );
            }
          } else {
            return const Loader();
          }
        },
      ),
    ),
  );
}
