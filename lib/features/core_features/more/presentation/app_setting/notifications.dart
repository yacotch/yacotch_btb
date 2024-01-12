import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_checkBox.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/core_features/more/controller/more_cubit.dart';

class EnableNotificationsWidget extends StatelessWidget {
  const EnableNotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreCubit(),
        child: BlocBuilder<MoreCubit, MoreState>(
          builder: (context, state) => SizedBox(
            height: 19.h,
            child: Row(
              children: [
                CustomText(
                  text: LanguageHelper.getTranslation(context)
                      .enable_notifications,
                  fontSize: AppConstants.textSize16,
                ),
                const Spacer(),
                Transform.scale(
                  scale: 1.5,
                  child: CustomCheckbox(
                    value: MoreCubit.of(context).isEnableNotification,
                    onChanged: (value) =>
                        MoreCubit.of(context).enableNotifications(),
                    checkColor: AppColors.white,
                    activeColor: AppColors.accentColorLight,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
