import 'dart:io';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/helpers/url_launcher.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';

class ClickablePdfNameWidget extends StatelessWidget {
  const ClickablePdfNameWidget(
      {required this.index,
      this.file,
      this.path,
      this.showDelete = true,
      super.key});
  final String? path;
  final File? file;
  final int index;
  final bool showDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => file != null
          ? NavigationHelper.goto(
              screen: Scaffold(
                body: PDFViewer(document: await PDFDocument.fromFile(file!)),
              ),
              context: context)
          : UrlLauncherHelper.open(path!, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showDelete)
            InkWell(
              onTap: () => TrainerProfileCubit.of(context)
                  .deleteExperienceFile(_getSpecificData()),
              child: const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 20,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text:
                  "${LanguageHelper.getTranslation(context).experienceCertification} ${index + 1}",
              color: AppColors.lightGrey,
              fontSize: AppConstants.textSize14,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  String _getSpecificData() => file == null ? path! : file!.path;
}
