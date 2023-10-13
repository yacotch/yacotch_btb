<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/courses_controller/courses_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_details.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/navigation/route_generator.dart';
import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_rating_bar_widget.dart';
import '../../../../../generated/l10n.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({Key? key}) : super(key: key);

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    CoursesCubit.of(context).getCourses(context, isActive: false);
    super.initState();
  }

  int tabbed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).courses,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).pending,
                    index: 1,
                    ontap: () => setState(() {
                          tabbed = 1;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(0);
                        }),
                    tabbed: tabbed),
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).approved,
                    index: 2,
                    ontap: () => setState(() {
                          tabbed = 2;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(1);
                        }),
                    tabbed: tabbed),
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).expired,
                    index: 3,
                    ontap: () => setState(() {
                          tabbed = 3;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(2);
                        }),
                    tabbed: tabbed),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const <Widget>[
                WaitingList(),
                AcceptedList(),
                RefusedList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  final Function() ontap;
  final int tabbed;
  final int index;
  final String text;
  const _FilterItem(
      {required this.index,
      required this.ontap,
      required this.tabbed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            ontap();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: tabbed == index ? AppColors.accentColorLight : null,
                  border: Border.all(color: AppColors.accentColorLight),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Center(
                child: CustomText(
                  text: text,
                  color: tabbed == index
                      ? AppColors.primaryColorLight
                      : AppColors.accentColorLight,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.textSize16,
                ),
              )),
        ),
      ),
    );
  }
}

class WaitingList extends StatelessWidget {
  const WaitingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
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

class AcceptedList extends StatelessWidget {
  const AcceptedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  LanguageHelper.getTranslation(context).no_courses,
                ),
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

class RefusedList extends StatelessWidget {
  const RefusedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  LanguageHelper.getTranslation(context).no_courses,
                ),
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

// class ImageWithNameTrainee extends StatelessWidget {
//   const ImageWithNameTrainee({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
//         image: const DecorationImage(
//           image: AssetImage(AppConstants.COACH_COVER_IMG),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: SizedBox(
//           height: 35.h,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               BlurWidget(
//                 height: 100.h,
//                 child: Center(
//                   child: CustomText(
//                     text: "مصطفي محمد",
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.white,
//                     fontSize: AppConstants.textSize16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CardDetails extends StatelessWidget {
  final bool selectedCard;
  final CourseModel courseModel;
  const CardDetails(
      {Key? key, required this.selectedCard, required this.courseModel})
      : super(key: key);

  Widget _buildRatingWidget({
    required double average,
  }) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
              height: 16.h,
              child: CustomRatingBarWidget(rate: average, itemSize: 12.w)),
          CustomText(
            text: '$average',
            fontSize: AppConstants.textSize18,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationHelper.goto(
            screen: MyCourseDetails(courseId: courseModel.id!),
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
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: CustomText(
                              text: courseModel.name ?? "",
                              fontSize: AppConstants.textSize16,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.user,
                                    color: AppColors.lightGrey,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text: "${courseModel.traineesCount}",
                                    fontSize: AppConstants.textSize16,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.accentColorLight,
                                  ),
                                ],
                              ))
                        ],
                      ),
                      CustomText(
                        text:
                            "${courseModel.fee} ${Translation.of(context).saudi_riyal}",
                        fontSize: AppConstants.textSize16,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColorLight,
                      ),
                      _buildRatingWidget(average: 4.2),
                      selectedCard
                          ? const SizedBox()
                          : CustomText(
                              text:
                                  "المده المتبقيه: ${courseModel.trainingHoursCount}",
                              fontSize: AppConstants.textSize16,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
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
                          image: NetworkImage(courseModel.imageUrl ?? ""),
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
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/courses_controller/courses_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_details.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/navigation/route_generator.dart';
import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_rating_bar_widget.dart';
import '../../../../../generated/l10n.dart';

class MyCoursesView extends StatefulWidget {
  const MyCoursesView({Key? key}) : super(key: key);

  @override
  State<MyCoursesView> createState() => _MyCoursesViewState();
}

class _MyCoursesViewState extends State<MyCoursesView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    CoursesCubit.of(context).getCourses(context, isActive: false);
    super.initState();
  }

  int tabbed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).courses,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).pending,
                    index: 1,
                    ontap: () => setState(() {
                          tabbed = 1;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(0);
                        }),
                    tabbed: tabbed),
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).approved,
                    index: 2,
                    ontap: () => setState(() {
                          tabbed = 2;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(1);
                        }),
                    tabbed: tabbed),
                _FilterItem(
                    text: LanguageHelper.getTranslation(context).expired,
                    index: 3,
                    ontap: () => setState(() {
                          tabbed = 3;
                          CoursesCubit.of(context)
                              .getCourses(context, isFinished: true);
                          tabController!.animateTo(2);
                        }),
                    tabbed: tabbed),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const <Widget>[
                WaitingList(),
                AcceptedList(),
                RefusedList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  final Function() ontap;
  final int tabbed;
  final int index;
  final String text;
  const _FilterItem(
      {required this.index,
      required this.ontap,
      required this.tabbed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            ontap();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: tabbed == index ? AppColors.accentColorLight : null,
                  border: Border.all(color: AppColors.accentColorLight),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Center(
                child: CustomText(
                  text: text,
                  color: tabbed == index
                      ? AppColors.primaryColorLight
                      : AppColors.accentColorLight,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstants.textSize16,
                ),
              )),
        ),
      ),
    );
  }
}

class WaitingList extends StatelessWidget {
  const WaitingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
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

class AcceptedList extends StatelessWidget {
  const AcceptedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  LanguageHelper.getTranslation(context).no_courses,
                ),
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

class RefusedList extends StatelessWidget {
  const RefusedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetCoursesLoaded) {
            if (state.courses.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardDetails(
                          selectedCard: false,
                          courseModel: state.courses[index]),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  LanguageHelper.getTranslation(context).no_courses,
                ),
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

// class ImageWithNameTrainee extends StatelessWidget {
//   const ImageWithNameTrainee({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
//         image: const DecorationImage(
//           image: AssetImage(AppConstants.COACH_COVER_IMG),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: SizedBox(
//           height: 35.h,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               BlurWidget(
//                 height: 100.h,
//                 child: Center(
//                   child: CustomText(
//                     text: "مصطفي محمد",
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.white,
//                     fontSize: AppConstants.textSize16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CardDetails extends StatelessWidget {
  final bool selectedCard;
  final CourseModel courseModel;
  const CardDetails(
      {Key? key, required this.selectedCard, required this.courseModel})
      : super(key: key);

  Widget _buildRatingWidget({
    required double average,
  }) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
              height: 16.h,
              child: CustomRatingBarWidget(rate: average, itemSize: 12.w)),
          CustomText(
            text: '$average',
            fontSize: AppConstants.textSize18,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationHelper.goto(
            screen: MyCourseDetails(courseId: courseModel.id!),
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
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: CustomText(
                              text: courseModel.name ?? "",
                              fontSize: AppConstants.textSize16,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.user,
                                    color: AppColors.lightGrey,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text: "${courseModel.traineesCount}",
                                    fontSize: AppConstants.textSize16,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.accentColorLight,
                                  ),
                                ],
                              ))
                        ],
                      ),
                      CustomText(
                        text:
                            "${courseModel.fee} ${Translation.of(context).saudi_riyal}",
                        fontSize: AppConstants.textSize16,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        color: AppColors.accentColorLight,
                      ),
                      _buildRatingWidget(average: 4.2),
                      selectedCard
                          ? const SizedBox()
                          : CustomText(
                              text:
                                  "المده المتبقيه: ${courseModel.trainingHoursCount}",
                              fontSize: AppConstants.textSize16,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
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
                          image: NetworkImage(courseModel.imageUrl ?? ""),
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
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
