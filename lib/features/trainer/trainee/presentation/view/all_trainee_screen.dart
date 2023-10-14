import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/trainee/presentation/view/trainee_profile_view.dart';

import '../../../../../core/models/new_trainee_model.dart';
import '../../../../../core/ui/widgets/custom_text.dart';
import '../../../../../core/ui/widgets/precentage_show.dart';

class AllTraineeScreen extends StatelessWidget {
  const AllTraineeScreen({Key? key}) : super(key: key);

  Widget traineeCard(NewTraineeModel newTraineeModel, {required context}) {
    return InkWell(
      onTap: () {
        NavigationHelper.goto(
            screen: TraineeProfileScreen(args: {
              "courseId": newTraineeModel.course!.value,
              "traineeId": newTraineeModel.trainee!.id
            }),
            context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 140.h,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.linearCardTrainee1Color.withOpacity(1),
                        AppColors.linearCardTrainee2Color.withOpacity(1),
                        AppColors.linearCardTrainee3Color.withOpacity(1),
                        AppColors.linearCardTrainee4Color.withOpacity(1),
                      ]),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                        text: newTraineeModel.trainee!.name ?? "",
                        fontSize: AppConstants.textSize18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      CustomText(
                        text: newTraineeModel.course!.text ?? "",
                        fontSize: AppConstants.textSize16,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                      // CustomText(
                      //   text: "${newTraineeModel.trainee} ريال",
                      //   fontSize: AppConstants.textSize16,
                      //   maxLines: 2,
                      //   textAlign: TextAlign.start,
                      //   fontWeight: FontWeight.w400,
                      //   color: AppColors.accentColorLight,
                      // ),
                      PrecentageShow(
                        prescentageValue: newTraineeModel.progress!.toInt(),
                      )
                    ],
                  ),
                ),
              ),
              Gaps.hGap4,
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              newTraineeModel.trainee!.imageUrl ?? ""),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransparentAppBar(
          title: LanguageHelper.getTranslation(context).trainees,
        ),
        body: BlocBuilder<HomeTrainerCubit, HomeTrainerState>(
          builder: (context, state) {
            if (HomeTrainerCubit.of(context).newTrainees != null) {
              if (HomeTrainerCubit.of(context).newTrainees!.isNotEmpty) {
                return ListView.builder(
                    itemCount: HomeTrainerCubit.of(context).newTrainees!.length,
                    itemBuilder: (context, index) {
                      return traineeCard(
                          HomeTrainerCubit.of(context).newTrainees![index],
                          context: context);
                    });
              } else {
                return Center(
                  child:
                      Text(LanguageHelper.getTranslation(context).no_trainees),
                );
              }
            } else {
              return const Loader();
            }
          },
        ));
  }
}
