import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/models/trainer_model.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/widgets/header.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/widgets/new_trainees.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/widgets/subscription_plan.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/widgets/wanted_courses.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import '../../../../../core/common/style/gaps.dart';

class HomeTrainerScreen extends StatefulWidget {
  const HomeTrainerScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  State<HomeTrainerScreen> createState() => _HomeTrainerScreenState();
}

class _HomeTrainerScreenState extends State<HomeTrainerScreen> {
  @override
  void initState() {
    TrainerProfileCubit.of(context).getTrainerProfile(context);
    HomeTrainerCubit.of(context).getMostWantedCourses(context);
    HomeTrainerCubit.of(context).getNewTrainees(context);
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
            buildNewTraineesSection(),
            Gaps.vGap16,
            trainerBouquet(widget.typeUser),
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
