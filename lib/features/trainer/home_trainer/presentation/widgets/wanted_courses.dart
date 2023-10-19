import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/notifications/notification_service.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_details.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_view.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/library/carousel/custom_carousel.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/ui/physics/custom_scroll_physics.dart';
import '../../../../../core/ui/widgets/blur_widget.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';

String defautlCourseImgUrl =
    '"https://th.bing.com/th/id/R.ac1f841543a67786d0e2941b112b392e?rik=vdI7vYaDZthypg&pid=ImgRaw&r=0"';

class MostWantedCourses extends StatelessWidget {
  const MostWantedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<HomeTrainerCubit, HomeTrainerState>(
        builder: (context, state) {
          if (HomeTrainerCubit.of(context).topCourses != null) {
            if (HomeTrainerCubit.of(context).topCourses!.isNotEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: TitleWidget(
                      title: LanguageHelper.getTranslation(context)
                          .mostWantedCourses,
                      subtitleColorTapped: () => NavigationHelper.goto(
                          screen: const MyCoursesView(), context: context),
                      titleColor: AppColors.accentColorLight,
                      subtitle:
                          HomeTrainerCubit.of(context).topCourses!.isNotEmpty
                              ? Translation.of(context).see_all
                              : null,
                    ),
                  ),
                  Gaps.vGap16,
                  Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: CustomCarousel(
                      items: List.generate(
                        HomeTrainerCubit.of(context).topCourses!.length,
                        (index) => CourseItemWidget(
                            HomeTrainerCubit.of(context).topCourses![index]),
                      ),
                      options: CarouselOptions(
                        height: 344.h,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        scrollPhysics:
                            const CustomScrollPhysics(itemDimension: 1),
                        autoPlay: false,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(LanguageHelper.getTranslation(context).no_courses),
              );
            }
          } else {
            return const Loader();
          }
        },
      ),
    );
  }
}

class CourseItemWidget extends StatelessWidget {
  final CourseModel courseModel;
  const CourseItemWidget(this.courseModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var trans = LanguageHelper.getTranslation(context);
    return InkWell(
      onTap: () {
        NavigationHelper.goto(
            screen: MyCourseDetails(courseId: courseModel.id!),
            context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
            image: DecorationImage(
              image: NetworkImage(
                courseModel.imageUrl == null || courseModel.imageUrl!.isEmpty
                    ? defautlCourseImgUrl
                    : courseModel.imageUrl!,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: BlurWidget(
                      height: 100.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, top: 14.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: courseModel.name ?? "",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                  fontSize: AppConstants.textSize16,
                                ),
                                Gaps.hGap4,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 20,
                                      color: AppColors.accentColorLight,
                                    ),
                                    SizedBox(
                                      height: 10,
                                      child: CustomText(
                                        text: "${courseModel.rate} ",
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppConstants.textSize16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8.w, 0, 0, 0),
                            child: CustomText(
                              text:
                                  "${courseModel.fee} ${Translation.of(context).saudi_riyal}",
                              fontWeight: FontWeight.w600,
                              color: AppColors.accentColorLight,
                              fontSize: AppConstants.textSize12,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8.w, 0, 8.w, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: courseModel.isActive == true
                                          ? AppColors.greenColorButton
                                          : AppColors.red,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomText(
                                      text: courseModel.isActive == true
                                          ? trans.active
                                          : trans.not_active,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: AppColors.accentColorLight,
                            height: 7.h,
                            width: 101.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
