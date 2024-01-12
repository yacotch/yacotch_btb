import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/title_widget.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/about_app/button.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/feed_back/button.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/language.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/logout.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/notifications.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/privacy_policy/button.dart';

class MoreAppSetting extends StatelessWidget {
  const MoreAppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(
            title: LanguageHelper.getTranslation(context).app_settings,
          ),
          Gaps.vGap16,
          CustomText(
            text: LanguageHelper.getTranslation(context).language,
            fontSize: AppConstants.textSize16,
          ),
          Gaps.vGap16,
          const MoreLanguageButton(),
          const PrivacyPolicyButton(),
          const EnableNotificationsWidget(),
          const FeedBackButton(),
          const MoreAboutAppButton(),
          const MoreLogoutButton(),
          Gaps.vGap40,
        ],
      ),
    );
  }
}
