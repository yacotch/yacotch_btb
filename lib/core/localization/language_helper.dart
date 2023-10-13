import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
abstract class LanguageHelper {
  static AppLocalizations getTranslation(BuildContext context) =>
      AppLocalizations.of(context)!;
}
