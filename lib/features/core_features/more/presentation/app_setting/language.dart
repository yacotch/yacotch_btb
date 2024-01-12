import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/flutter_localization.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

class MoreLanguageButton extends StatelessWidget {
  const MoreLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<LocalizationProvider>(
          builder: (_, provider, __) {
            return InkWell(
              onTap: () async {
                provider.changeLanguage(
                    const Locale(AppConstants.LANG_AR), context);
              },
              child: BlurWidget(
                height: 20.h,
                width: 57.w,
                colorBorder: provider.appLocal.languageCode == 'ar'
                    ? AppColors.accentColorLight
                    : null,
                child: Center(
                    child: CustomText(
                  text: LanguageHelper.getTranslation(context).arabic,
                  fontSize: AppConstants.textSize14,
                )),
              ),
            );
          },
        ),
        Gaps.hGap32,
        Consumer<LocalizationProvider>(
          builder: (_, provider, __) {
            return InkWell(
              onTap: () async {
                provider.changeLanguage(
                    const Locale(AppConstants.LANG_EN), context);
              },
              child: BlurWidget(
                height: 20.h,
                width: 60.w,
                colorBorder: provider.appLocal.languageCode == 'en'
                    ? AppColors.accentColorLight
                    : null,
                child: Center(
                  child: CustomText(
                    text: LanguageHelper.getTranslation(context).english,
                    fontSize: AppConstants.textSize14,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
