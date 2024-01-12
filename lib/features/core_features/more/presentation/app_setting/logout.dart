
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/Acount/data/repositories/auth_repo.dart';

class MoreLogoutButton extends StatelessWidget {
  const MoreLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthRepo().logout(context);
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
        child: CustomText(
          text: LanguageHelper.getTranslation(context).logOut,
          fontSize: AppConstants.textSize16,
        ),
      ),
    );
  }
}