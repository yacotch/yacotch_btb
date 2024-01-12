import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/validators.dart';
import 'package:trainee_restaurantapp/core/helpers/url_launcher.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/functions.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/edit/profile_image.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/pdf.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/dimens.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/widgets/custom_button.dart';
import '../../../../../core/ui/widgets/custom_text.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';

class EditProfileScreenContent extends StatefulWidget {
  @override
  State<EditProfileScreenContent> createState() =>
      _EditProfileScreenContentState();
}

class _EditProfileScreenContentState extends State<EditProfileScreenContent> {
  @override
  void initState() {
    EditTrainerProfileFunctions.initailzeControllers(context);
    TrainerProfileCubit.of(context).getTrainerProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: LanguageHelper.getTranslation(context).edit_profile,
      ),
      body: BlocConsumer<TrainerProfileCubit, TrainerProfileState>(
        listener: (context, state) async {
          if (state is UpdateTranierProfileLoaded) {
            await EditTrainerProfileFunctions.updateProfile(context);
          }
        },
        builder: (context, state) {
          if (state is GetTrainerProfileLoading) {
            return const Loader();
          } else {
            var cubit = TrainerProfileCubit.of(context);
            var tr = LanguageHelper.getTranslation(context);
            return SizedBox(
              height: 1.sh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      _ProfileImage(cubit: cubit),
                      SizedBox(height: 55.h),
                      _buildTextFiledWidget(
                          type: TextInputType.name,
                          validator: (p0) {
                            return null;
                          },
                          title: tr.full_name,
                          textEditingController: cubit.nameController),
                      Gaps.vGap24,
                      _buildTextFiledWidget(
                          type: TextInputType.number,
                          validator: (input) =>
                              Validators.isNumber(input!, context),
                          title: tr.phone,
                          isPhoneNumber: true,
                          textEditingController: cubit.phoneController),
                      Gaps.vGap24,
                      _buildTextFiledWidget(
                          type: TextInputType.number,
                          validator: (input) =>
                              Validators.isNumber(input!, context),
                          title: tr.hourRate,
                          textEditingController: cubit.hourRateController),
                      Gaps.vGap24,
                      uploadSignUpFile(
                        text: tr.cV,
                        image: cubit.networkCvUrl ?? "",
                        file: cubit.fileCvUrl ?? File(''),
                        fun: () => cubit.getCv(),
                      ),
                      Gaps.vGap24,
                      EditProfileFilesList(
                        title: tr.experienceCertification,
                        files: [
                          ...cubit.pickedExperienceFilsList ?? [],
                          ...cubit.oldExperienceFilesUrls ?? []
                        ],
                        onTap: () => cubit.getExperience(),
                      ),
                      _map(cubit: cubit),
                      Gaps.vGap24,
                      SizedBox(
                        height: 44.h,
                        width: 217.w,
                        child: (state is UploadImageLoading)
                            ? const Center(child: CircularProgressIndicator())
                            : CustomElevatedButton(
                                text: tr.save,
                                onTap: () => cubit.updateTrainerProfile(),
                                textSize: AppConstants.textSize20,
                                borderRadius: AppConstants.borderRadius4,
                              ),
                      ),
                      Gaps.vGap24,
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  uploadSignUpFile(
      {required String text,
      required File file,
      required String image,
      required Function() fun}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async => await fun(),
        child: SizedBox(
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.hGap20,
              CustomText(
                  text: text,
                  fontSize: AppConstants.textSize18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentColorLight),
              Gaps.hGap12,
              DottedBorder(
                color: AppColors.white,
                dashPattern: const [5, 3],
                radius: const Radius.circular(10),
                borderType: BorderType.Rect,
                strokeWidth: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((Dimens.dp12))),
                  height: Dimens.dp80.h,
                  width: double.infinity,
                  child: file.path.isNotEmpty
                      ? Image.file(file)
                      : image == ''
                          ? Image.asset(AppConstants.COVER_IMG)
                          : Image.network(image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFiledWidget(
      {required String title,
      bool isPhoneNumber = false,
      required TextInputType type,
      String? Function(String?)? validator,
      required TextEditingController textEditingController}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppConstants.textSize16,
        ),
        Gaps.vGap4,
        EmailTextField(
            controller: textEditingController,
            text: null,
            keboardType: type,
            validator: (input) => validator!(input))
      ],
    );
  }
}

class _map extends StatelessWidget {
  const _map({
    super.key,
    required this.cubit,
  });

  final TrainerProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            cubit.onLocationClick(context);
          },
          child: CustomText(
            text: LanguageHelper.getTranslation(context).select_your_location,
            color: AppColors.accentColorLight,
            fontSize: AppConstants.textSize16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.cubit,
  });

  final TrainerProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return EditTrainerProfileImageWidget(
      file: cubit.fileImageUrl ?? File(''),
      imageNetwork: cubit.networkImageUrl ?? '',
    );
  }
}

class EditProfileFilesList extends StatelessWidget {
  const EditProfileFilesList(
      {required this.files,
      required this.onTap,
      required this.title,
      super.key});
  final String title;
  final VoidCallback onTap;
  final List files;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.hGap20,
              CustomText(
                  text: title,
                  fontSize: AppConstants.textSize18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentColorLight),
              Gaps.hGap12,
              DottedBorder(
                color: AppColors.white,
                dashPattern: const [5, 3],
                radius: const Radius.circular(10),
                borderType: BorderType.Rect,
                strokeWidth: 1,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((Dimens.dp12))),
                    height: Dimens.dp80.h,
                    width: .8.sw,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: files.isNotEmpty ? files.length : 1,
                      itemBuilder: (context, index) => files.isEmpty
                          ? Image.asset(AppConstants.COVER_IMG)
                          : _getPdf(files[index], index, context),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getPdf(data, int index, BuildContext context) => data is String
    ? ClickablePdfNameWidget(
        index: index,
        path: data,
      )
    : ClickablePdfNameWidget(
        index: index,
        file: data,
      );
