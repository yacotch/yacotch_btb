import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/validators.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_button.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../controller/update_trainee_progress_cubit.dart';

class AddNewTraineeEntryScreen extends StatefulWidget {
  final int courseId, traineeId;
  const AddNewTraineeEntryScreen(this.courseId, this.traineeId, {super.key});

  @override
  State<AddNewTraineeEntryScreen> createState() =>
      _AddNewTraineeEntryScreenState();
}

class _AddNewTraineeEntryScreenState extends State<AddNewTraineeEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => UpdateTraineeProgressCubit(),
      child:
          BlocBuilder<UpdateTraineeProgressCubit, UpdateTraineeProgressState>(
        buildWhen: (previous, current) =>
            previous != current || current is UpdateTraineeProgressLoading,
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Form(
                  key: UpdateTraineeProgressCubit.of(context).formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: LanguageHelper.getTranslation(context).add_values,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstants.textSize18,
                      ),
                      Gaps.vGap16,
                      EmailTextField(
                        keboardType: TextInputType.number,
                        validator: (input) =>
                            Validators.isNumber(input!, context),
                        text: LanguageHelper.getTranslation(context).weight,
                        onFiledSubmitted: () {
                          FocusScope.of(context).requestFocus(
                              UpdateTraineeProgressCubit.of(context)
                                  .fatPercentageFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        controller: UpdateTraineeProgressCubit.of(context)
                            .weightController,
                        focusNode: UpdateTraineeProgressCubit.of(context)
                            .weightFocusNode,
                      ),
                      Gaps.vGap16,
                      EmailTextField(
                        keboardType: TextInputType.number,
                        validator: (input) =>
                            Validators.isNumber(input!, context),
                        text: LanguageHelper.getTranslation(context).fat_perct,
                        onFiledSubmitted: () {
                          FocusScope.of(context).requestFocus(
                              UpdateTraineeProgressCubit.of(context)
                                  .completedHoursFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        controller: UpdateTraineeProgressCubit.of(context)
                            .fatPercentageController,
                        focusNode: UpdateTraineeProgressCubit.of(context)
                            .fatPercentageFocusNode,
                      ),
                      Gaps.vGap16,
                      EmailTextField(
                        keboardType: TextInputType.number,
                        validator: (input) =>
                            Validators.isNumber(input!, context),
                        text:
                            LanguageHelper.getTranslation(context).finishedHour,
                        onFiledSubmitted: () {
                          FocusScope.of(context).requestFocus(
                              UpdateTraineeProgressCubit.of(context)
                                  .absenceCountFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        controller: UpdateTraineeProgressCubit.of(context)
                            .completedHoursController,
                        focusNode: UpdateTraineeProgressCubit.of(context)
                            .completedHoursFocusNode,
                      ),
                      Gaps.vGap16,
                      EmailTextField(
                        keboardType: TextInputType.number,
                        validator: (input) =>
                            Validators.isNumber(input!, context),
                        text: LanguageHelper.getTranslation(context)
                            .numberOfAbsenece,
                        textInputAction: TextInputAction.next,
                        controller: UpdateTraineeProgressCubit.of(context)
                            .absenceCountController,
                        focusNode: UpdateTraineeProgressCubit.of(context)
                            .absenceCountFocusNode,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 45.0,
                            horizontal: 20,
                          ),
                          child: CustomElevatedButton(
                            borderRadius: 12,
                            onTap: () async {
                              await UpdateTraineeProgressCubit.of(context)
                                  .updateTraineeProgress(context);

                              await HomeTrainerCubit.of(context)
                                  .getTrainee(widget.courseId, widget.traineeId)
                                  .then((value) => null);
                            },
                            text: LanguageHelper.getTranslation(context).add,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
