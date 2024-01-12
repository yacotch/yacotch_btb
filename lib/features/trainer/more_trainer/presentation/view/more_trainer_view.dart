import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_view.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/my_order_view.dart';
import 'package:trainee_restaurantapp/features/trainer/trainee/presentation/view/all_trainee_screen.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/widgets/custom_text.dart';
import '../../../subscription/presentation/view/subscription_screen.dart';

class MoreTrainerScreen extends StatelessWidget {
  const MoreTrainerScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  Widget _buildChipWidget(
      {required String title,
      required String imgPath,
      required Function onPressed}) {
    double? rightPosition;
    double? leftPosition;
    leftPosition = 0.0;
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: 180.w,
          height: 45.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius32),
                child: Image.asset(
                  imgPath,
                  height: 45.h,
                  width: 45.w,
                  fit: BoxFit.cover,
                ),
              ),
              Gaps.hGap12,
              SizedBox(
                height: 18.h,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: title,
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstants.textSize16,
                  ),
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
    var tr = LanguageHelper.getTranslation(context);
    return MoreScreen(
      typeUser: typeUser,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildChipWidget(
              title: tr.courses,
              imgPath: AppConstants.SWIMMING_IMG,
              onPressed: () {
                NavigationHelper.goto(
                    context: context, screen: const MyCoursesView());
              }),
          _buildChipWidget(
              title: tr.trainee,
              imgPath: AppConstants.COACH1_IMAGE,
              onPressed: () {
                NavigationHelper.goto(
                    context: context, screen: const AllTraineeScreen());
              }),
          _buildChipWidget(
              title: tr.my_booking,
              imgPath: AppConstants.MOTCHY2_IMG,
              onPressed: () {
                NavigationHelper.goto(
                    screen: const MyOrderView(), context: context);
              }),
          _buildChipWidget(
              title: tr.subscription_plans,
              imgPath: AppConstants.VEGGIE2_IMG,
              onPressed: () {
                NavigationHelper.goto(
                    screen: SubscriptionScreen(
                      typeUser: typeUser,
                    ),
                    context: context);
              }),
        ],
      ),
    );
  }
}
