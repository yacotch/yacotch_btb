import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/validators.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/widgets/form_field.dart';

class SocialMediaContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController controller;

  SocialMediaContainer({
    required this.title,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: TextFieldWidget(
            type: TextInputType.url,
            textEditingController: controller,
            validator: (input) {
              if (Validators.isLinkValid(input!)) {
                return null; // Validation passed
              } else {
                return LanguageHelper.getTranslation(context).link_invalid;
              }
            },
            title: title,
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 20,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(
                  icon,
                  color: AppColors.accentColorLight,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
