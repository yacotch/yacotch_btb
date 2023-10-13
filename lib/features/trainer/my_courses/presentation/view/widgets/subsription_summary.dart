<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/models/course_model.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/courses_controller/courses_cubit.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class SubscriptionSummary extends StatelessWidget {
  final CourseModel course;
  const SubscriptionSummary(this.course);
  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Image.network(
              course.imageUrl ?? "",
              fit: BoxFit.cover,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 68.h,
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomText(
                        text: course.name ?? "",
                        fontSize: AppConstants.textSize16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Spacer(),
                    CustomText(
                      maxLines: 2,
                      text: course.description ?? "",
                      color: AppColors.white,
                      fontSize: AppConstants.textSize12,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Gaps.vGap4,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: tr.subscribers,
                                color: AppColors.white,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: "${course.traineesCount}",
                                color: AppColors.accentColorLight,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: tr.max_subscribers,
                                color: AppColors.white,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: "${course.bookingRequestsCount}",
                                color: AppColors.accentColorLight,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      text:
                          "${tr.remaining_duration} ${course.trainingHoursCount}",
                      fontSize: AppConstants.textSize14,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    CustomText(
                      text:
                          "${course.fee} ${Translation.of(context).saudi_riyal}",
                      fontSize: AppConstants.textSize16,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColorLight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/models/course_model.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/courses_controller/courses_cubit.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class SubscriptionSummary extends StatelessWidget {
  final CourseModel course;
  const SubscriptionSummary(this.course);
  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Image.network(
              course.imageUrl ?? "",
              fit: BoxFit.cover,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 68.h,
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomText(
                        text: course.name ?? "",
                        fontSize: AppConstants.textSize16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Spacer(),
                    CustomText(
                      maxLines: 2,
                      text: course.description ?? "",
                      color: AppColors.white,
                      fontSize: AppConstants.textSize12,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Gaps.vGap4,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: tr.subscribers,
                                color: AppColors.white,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: "${course.traineesCount}",
                                color: AppColors.accentColorLight,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                text: tr.max_subscribers,
                                color: AppColors.white,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                text: "${course.bookingRequestsCount}",
                                color: AppColors.accentColorLight,
                                fontSize: AppConstants.textSize14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      text:
                          "${tr.remaining_duration} ${course.trainingHoursCount}",
                      fontSize: AppConstants.textSize14,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    CustomText(
                      text:
                          "${course.fee} ${Translation.of(context).saudi_riyal}",
                      fontSize: AppConstants.textSize16,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColorLight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
