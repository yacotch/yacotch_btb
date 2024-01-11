import 'package:flutter/material.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core_features/more/privacy_policy/privacy_policy_screen_content.dart';

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
        title: Translation.of(context).privacy_policy,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PrivacyPolicyScreenContent(),
    );
  }
}
