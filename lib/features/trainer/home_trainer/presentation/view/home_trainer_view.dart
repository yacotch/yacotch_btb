import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/models/trainer_model.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/navigation/route_generator.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/widgets/header.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_details.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_view.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/trainee/presentation/view/all_trainee_screen.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/library/carousel/custom_carousel.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/models/new_trainee_model.dart';
import '../../../../../core/ui/physics/custom_scroll_physics.dart';
import '../../../../../core/ui/widgets/blur_widget.dart';
import '../../../../../core/ui/widgets/title_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../subscription/presentation/view/subscription_screen.dart';

class HomeTrainerScreen extends StatefulWidget {
  const HomeTrainerScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  State<HomeTrainerScreen> createState() => _HomeTrainerScreenState();
}

class _HomeTrainerScreenState extends State<HomeTrainerScreen> {
  Widget _buildMyCourseItemWidget(CourseModel courseModel) {
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
                courseModel.imageUrl ?? "",
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
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

  Widget mostWantedCourse() {
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
                          (index) => _buildMyCourseItemWidget(
                              HomeTrainerCubit.of(context).topCourses![index])),
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

  @override
  void initState() {
    TrainerProfileCubit.of(context).getTrainerProfile(context);
    HomeTrainerCubit.of(context).getMostWantedCourses(context);
    HomeTrainerCubit.of(context).getNewTrainees(context);
  }

  Widget _buildSectionWidget() {
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
                      title:
                          LanguageHelper.getTranslation(context).new_trainees,
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
                                                      HomeTrainerCubit.of(
                                                              context)
                                                          .newTrainees![2]
                                                          .course!
                                                          .value,
                                                  "traineeId":
                                                      HomeTrainerCubit.of(
                                                              context)
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
                  child:
                      Text(LanguageHelper.getTranslation(context).no_trainees),
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

  Widget imageWithNameTrainee(NewTraineeModel newTraineeModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
        image: DecorationImage(
          image: NetworkImage(newTraineeModel.trainee!.imageUrl ?? ""),
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

  Widget trainerBouquet() {
    return BlocBuilder<TrainerProfileCubit, TrainerProfileState>(
      builder: (context, state) {
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
                      title: "الباقه الحاليه",
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
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
                                          "${TrainerProfileCubit.of(context).trainerModel?.subscription!.fee} ${Translation.of(context).saudi_riyal}",
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
                                      color: AppColors.transparent
                                          .withOpacity(0.2)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          AppConstants.blurDegree10)),
                                  gradient: LinearGradient(colors: [
                                    AppColors.transparent.withOpacity(0.0),
                                    AppColors.transparent.withOpacity(0.5)
                                  ])),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SubscriptionScreen(
                                                  typeUser: widget.typeUser),
                                        ));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            trainerProfile(),
            Gaps.vGap16,
            mostWantedCourse(),
            Gaps.vGap16,
            _buildSectionWidget(),
            Gaps.vGap16,
            trainerBouquet(),
            Gaps.vGap60,
          ],
        ),
      ),
    );
  }
}

class TrainerProfileImageWidget extends StatelessWidget {
  const TrainerProfileImageWidget({
    super.key,
    required this.trainerModel,
  });

  final TrainerModel? trainerModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.w),
        ),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    FullImageScreen(trainerModel: trainerModel),
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: trainerModel!.imageUrl != null
                      ? Image.network(
                          trainerModel!.imageUrl ?? "",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        )
                      : Image.asset(
                          AppConstants.AVATER_IMG,
                          fit: BoxFit.fill,
                        )),
            )),
      ),
    );
  }
}

class FullImageScreen extends StatelessWidget {
  const FullImageScreen({
    super.key,
    required this.trainerModel,
  });

  final TrainerModel? trainerModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: trainerModel!.imageUrl != null
          ? Center(
              child: Image.network(
                trainerModel!.imageUrl ?? "",
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppConstants.COACH1_IMAGE);
                },
              ),
            )
          : Image.asset(AppConstants.AVATER_IMG),
    );
  }
}
