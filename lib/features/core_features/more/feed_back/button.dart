import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/core_features/more/feed_back/screen.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class FeedBackButton extends StatelessWidget {
  const FeedBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationHelper.goto(
          screen: const FeedbackScreen(), context: context),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
        child: CustomText(
          text: Translation.of(context).feedback,
          fontSize: AppConstants.textSize16,
        ),
      ),
    );
  }
}
