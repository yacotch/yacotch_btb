// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  open(String url, BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Toast.show(LanguageHelper.getTranslation(context).please_enter_otp);
    }
  }
}
