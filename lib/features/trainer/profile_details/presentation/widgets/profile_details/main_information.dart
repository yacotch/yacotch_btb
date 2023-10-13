import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/hour_price.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/category.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/name.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/phone.dart';

class TrainerMainInformationsWidget extends StatelessWidget {
  const TrainerMainInformationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: BlurWidget(
        blurColor: AppColors.grey.withOpacity(0.6),
        height: 100.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 14.h),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TrainerNameWidget(),
                ],
              ),
            ),
            //category hour price
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TrainerCatgoryWidget(),
                  //hour price
                  TrainerHourPriceWidget()
                ],
              ),
            ),
            // Padding(
            //   padding:
            //       EdgeInsetsDirectional.fromSTEB(8.w, 0, 8.w, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       const FaIcon(
            //         FontAwesomeIcons.locationDot,
            //         color: AppColors.accentColorLight,
            //         size: 14,
            //       ),
            //       Gaps.hGap8,
            //       CustomText(
            //         text: "جدة,شارع الملك",
            //         fontWeight: FontWeight.w500,
            //         color: AppColors.white,
            //         fontSize: AppConstants.textSize14,
            //       ),
            //     ],
            //   ),
            // ),
            const TrainerPhoneWidget(),
          ],
        ),
      ),
    );
  }
}
