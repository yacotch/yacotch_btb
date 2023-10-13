import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/localization_provider.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

class AuthChangeLanguageTextButton extends StatelessWidget {
  const AuthChangeLanguageTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLangArabic =
        Provider.of<LocalizationProvider>(context).currentLanguage == "ar";
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Provider.of<LocalizationProvider>(context, listen: false)
            .changeLanguage(
                isLangArabic ? const Locale("en") : const Locale("ar"),
                context);
      },
      child: CustomText(
        text: !isLangArabic ? "العربية" : "English",
        color: AppColors.accentColorLight,
        fontSize: AppConstants.textSize14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
