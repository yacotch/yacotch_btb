import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/features/trainer/more_trainer/presentation/controller/more_trainer_cubit.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/widgets/blur_widget.dart';
import '../../../../../core/ui/widgets/custom_text.dart';

class AboutAppScreenContent extends StatefulWidget {
  const AboutAppScreenContent({super.key});

  @override
  State<AboutAppScreenContent> createState() => _AboutAppScreenContentState();
}

class _AboutAppScreenContentState extends State<AboutAppScreenContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreTrainerCubit()..getAboutApp(),
        lazy: false,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gaps.vGap16,
                Image.asset(
                  AppConstants.APP_LOGO_IMG,
                  width: 117.w,
                  fit: BoxFit.contain,
                ),
                Gaps.vGap40,
                _Content()
              ],
            ),
          ),
        ));
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreTrainerCubit, MoreTrainerState>(
        builder: (context, state) {
      return BlurWidget(
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: CustomText(
            text: state is AboutAppLoaded ? state.data : "",
            fontSize: AppConstants.textSize16,
            textAlign: TextAlign.center,
            height: 2.h,
          ),
        ),
      );
    });
  }
}
