import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/helpers/url_launcher.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';

class ClickablePdfNameWidget extends StatelessWidget {
  const ClickablePdfNameWidget(
      {required this.index, required this.path, super.key});
  final String path;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UrlLauncherHelper.open(path, context),
      child: CustomText(
        text:
            "${LanguageHelper.getTranslation(context).experienceCertification} ${index + 1}",
        color: AppColors.lightGrey,
        fontSize: AppConstants.textSize14,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.end,
      ),
    );
  }
}
