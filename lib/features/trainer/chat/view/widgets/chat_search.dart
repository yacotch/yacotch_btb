import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundGradient3,
              AppColors.backgroundGradient2,
              AppColors.backgroundGradient1,
            ]),
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
//todo translate
          hintText: 'Search for any chat',
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
