import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/app_setting/about_app/content.dart';


class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: LanguageHelper.getTranslation(context).about_app,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:const AboutAppScreenContent(),
    );
  }
}
