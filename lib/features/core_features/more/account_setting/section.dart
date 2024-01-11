import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/title_widget.dart';
import 'package:trainee_restaurantapp/features/core_features/more/account_setting/change_password.dart';
import 'package:trainee_restaurantapp/features/core_features/more/account_setting/delete_account.dart';

class AccountSettingWidget extends StatelessWidget {
  const AccountSettingWidget(this.typeUser, {super.key});
  final int typeUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.vGap30,
        const _Title(),
        Gaps.vGap10,
        MoreScreenChangePasswordButton(typeUser),
        Gaps.vGap10,
        const MoreScreenDeleteAccountButton(),
        Gaps.vGap10
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return TitleWidget(
        title: LanguageHelper.getTranslation(context).account_settings);
  }
}
