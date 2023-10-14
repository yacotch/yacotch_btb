import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/app_config.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/flutter_localization.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/data/repositories/trainer_profile_repo.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
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
            ProfileAddressWidget(),
            const TrainerPhoneWidget(),
          ],
        ),
      ),
    );
  }
}

String googleMapApiKey = 'AIzaSyB4d19CAL7u_hJ8k4P7EaQFcnner_Q9KEo';

class ProfileAddressWidget extends StatelessWidget {
  const ProfileAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = TrainerProfileCubit.of(context).trainerModel!;
    return FutureBuilder(
      future: TrainerProfileRepo().getProfileAddress(
          lat: user.latitude.toString(),
          lng: user.longitude.toString(),
          lang: Provider.of<LocalizationProvider>(context).currentLanguage,
          apiKey: googleMapApiKey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return SizedBox();
        var address = snapshot.data;
        return Padding(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 4.h, horizontal: 7.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FaIcon(
                FontAwesomeIcons.locationDot,
                color: AppColors.accentColorLight,
                size: 14,
              ),
              Gaps.hGap8,
              CustomText(
                text: address?.results?.first.formattedAddress ?? "",
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                fontSize: AppConstants.textSize14,
              ),
            ],
          ),
        );
      },
    );
  }
}
