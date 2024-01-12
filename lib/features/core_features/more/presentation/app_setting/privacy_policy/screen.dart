import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/privacy_policy/content.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: LanguageHelper.getTranslation(context).privacy_policy,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PrivacyPolicyScreenContent(),
    );
  }
}
