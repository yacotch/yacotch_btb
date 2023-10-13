import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

var FitlerGradientColors = [
  AppColors.transparent.withOpacity(.07),
  AppColors.transparent.withOpacity(0.3),
];

class FilterTabItem extends StatelessWidget {
  final String label;
  final int tabbed;
  final int index;
  final Function() onTap;

  FilterTabItem(
      {required this.label,
      required this.index,
      required this.tabbed,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            decoration: tabbed == index
                ? BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(colors: FitlerGradientColors))
                : null,
            child: Center(
              child: CustomText(
                text: label,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: AppConstants.textSize16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
