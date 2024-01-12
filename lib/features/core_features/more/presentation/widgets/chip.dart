import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

class MoreCustomChipWidget extends StatelessWidget {
  const MoreCustomChipWidget(
      {required this.title,
      required this.imgPath,
      required this.onPressed,
      super.key});
  final String title;
  final String imgPath;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: 143.w,
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
}
