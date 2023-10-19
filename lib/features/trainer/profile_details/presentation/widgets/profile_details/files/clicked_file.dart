import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class ClickedFileWidget extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  const ClickedFileWidget({this.text, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(),
      child: SizedBox(
        width: .75.sw,
        child: CustomText(
          maxLines: 1,
          text: text ?? Translation.of(context).no_data_found,
          textOverflow: TextOverflow.ellipsis,
          color: AppColors.lightGrey,
          fontSize: AppConstants.textSize14,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
