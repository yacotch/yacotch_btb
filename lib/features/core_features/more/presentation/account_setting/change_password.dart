import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/change_password_screen.dart';

class MoreScreenChangePasswordButton extends StatelessWidget {
  const MoreScreenChangePasswordButton(this.typeUser,{super.key});

  final int typeUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangePasswordScreen(
                  screenNumber: typeUser,
                )));
      },
      child: Padding(
        padding: EdgeInsets.all(6.h),
        child: CustomText(
          text: LanguageHelper.getTranslation(context).change_password,
          fontSize: AppConstants.textSize14,
        ),
      ),
    );
  }
}
