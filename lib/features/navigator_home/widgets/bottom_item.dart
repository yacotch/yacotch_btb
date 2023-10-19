import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

class CustomButtomNavigationItem extends StatelessWidget {
  final int index, selectedIndex;
  final String text;
  final String? icon;
  final IconData? iconData;
  final Function(int index) onTap;
  const CustomButtomNavigationItem(
      {required this.onTap,
      this.iconData,
      this.icon,
      required this.text,
      required this.index,
      required this.selectedIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (icon != null)
              ImageIcon(
                AssetImage(
                  icon!,
                ),
                color: selectedIndex == index
                    ? AppColors.accentColorLight
                    : AppColors.white,
                size: AppConstants.textSize18.h,
              ),
            if (iconData != null)
              Icon(
                iconData,
                color: selectedIndex == index
                    ? AppColors.accentColorLight
                    : AppColors.white,
                size: AppConstants.textSize18.h,
              ),
            CustomText(
              text: text,
              color: selectedIndex == index
                  ? AppColors.accentColorLight
                  : AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
