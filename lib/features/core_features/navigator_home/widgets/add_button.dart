import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/shop/add_product/view/add_product_view.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/screen/add_course_view.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../restaurant/add_plate/view/add_plate_view.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({required this.homeType});

  final int homeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColorLight,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {
          if (homeType == 3) {
            NavigationHelper.goto(screen: AddPlateView(), context: context);
          } else if (homeType == 4) {
            NavigationHelper.goto(screen: AddProductView(), context: context);
          } else {
            NavigationHelper.goto(
                screen: const AddCourseView(), context: context);
          }
        },
        child: Container(
          width: double.minPositive,
          height: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.transparent.withOpacity(0.2)),
            gradient: LinearGradient(colors: [
              AppColors.transparent.withOpacity(0.3),
              AppColors.transparent.withOpacity(0)
            ]),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              FontAwesomeIcons.add,
              color: AppColors.accentColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
