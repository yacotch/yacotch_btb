import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/dimens.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/common/validators.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_appbar.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_button.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/widgets/form_field.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/widgets/social_media.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';


class CompletingShopInformationScreen extends StatefulWidget {
  final String phone;
  final int userType;

  const CompletingShopInformationScreen(
      {super.key, required this.phone, required this.userType});
  @override
  State<CompletingShopInformationScreen> createState() =>
      _CompletingShopInformationScreenState();
}

class _CompletingShopInformationScreenState
    extends State<CompletingShopInformationScreen> {
  @override
  Widget build(BuildContext context) {
    var trans = LanguageHelper.getTranslation(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: TransparentAppBar(title: trans.shop),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<AuthCubit>(context).formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                height: 1.sh,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 55.h),
                      TextFieldWidget(
                          type: TextInputType.name,
                          validator: (input) => !Validators.isArabic(input!)
                              ? trans.enter_at_letters
                              : null,
                          title: trans.shop_name_ar,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .nameArController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.name,
                          validator: (input) => !Validators.isEnglish(input!)
                              ? trans.enter_eng_letters
                              : null,
                          title: trans.shop_name_en,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .nameEnController),
                      TextFieldWidget(
                          type: TextInputType.name,
                          validator: (input) =>
                              !Validators.isNotEmptyString(input!)
                                  ? trans.errorEmptyField
                                  : null,
                          title: LanguageHelper.getTranslation(context)
                              .shopManagerName,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .mangerController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.emailAddress,
                          validator: (input) =>
                              Validators.isValidEmail(input!, context),
                          title: LanguageHelper.getTranslation(context)
                              .manager_email,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .emailController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.text,
                          validator: (input) =>
                              !Validators.isValidPassword(input!)
                                  ? LanguageHelper.getTranslation(context)
                                      .enter_valid_password
                                  : null,
                          title: LanguageHelper.getTranslation(context)
                              .manager_password,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .passwordController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.number,
                          validator: (input) =>
                              Validators.isNumber(input!, context),
                          title: LanguageHelper.getTranslation(context)
                              .manager_phone,
                          isPhoneNumber: true,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .phoneRestaurantController),
                      Gaps.vGap24,
                      Gaps.vGap24,
                      uploadSignUpFile(
                        text: trans.logo_ar,
                        file: BlocProvider.of<AuthCubit>(context).fileLogoAr ??
                            File(''),
                        onTap: () async {
                          await BlocProvider.of<AuthCubit>(context)
                              .pickLogoAr();
                        },
                      ),
                      Gaps.vGap8,
                      uploadSignUpFile(
                          text: trans.logo_en,
                          file:
                              BlocProvider.of<AuthCubit>(context).fileLogoEn ??
                                  File(''),
                          onTap: () async {
                            await BlocProvider.of<AuthCubit>(context)
                                .pickLogoEn();
                          }),
                      Gaps.vGap8,
                      uploadSignUpFile(
                        text: trans.cover_en,
                        file: BlocProvider.of<AuthCubit>(context).fileCoveEn ??
                            File(''),
                        onTap: () async {
                          await BlocProvider.of<AuthCubit>(context)
                              .pickCoverEn();
                        },
                      ),
                      Gaps.vGap8,
                      uploadSignUpFile(
                        text: trans.cover_ar,
                        file: BlocProvider.of<AuthCubit>(context).fileCoveAr ??
                            File(''),
                        onTap: () async {
                          await BlocProvider.of<AuthCubit>(context)
                              .pickCoverAr();
                        },
                      ),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.number,
                          validator: (input) =>
                              Validators.isNumber(input!, context),
                          title: Translation.of(context).phone,
                          isPhoneNumber: true,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .phoneController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.name,
                          validator: (input) => !Validators.isArabic(input!)
                              ? trans.enter_at_letters
                              : null,
                          title: trans.course_details_ar,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .descArController),
                      Gaps.vGap24,
                      TextFieldWidget(
                          type: TextInputType.name,
                          validator: (input) => !Validators.isEnglish(input!)
                              ? trans.enter_eng_letters
                              : null,
                          title: trans.course_details_en,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .descEnController),
                      Gaps.vGap24,
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              BlocProvider.of<AuthCubit>(context)
                                  .onLocationClick(context);
                            },
                            child: CustomText(
                              text: trans.select_your_location,
                              color: AppColors.accentColorLight,
                              fontSize: AppConstants.textSize16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Gaps.vGap8,
                      SocialMediaContainer(
                          title: trans.social_media_links,
                          controller: BlocProvider.of<AuthCubit>(context)
                              .facebookController,
                          icon: FontAwesomeIcons.squareFacebook),
                      SocialMediaContainer(
                        title: "",
                        icon: FontAwesomeIcons.instagram,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .instegramController,
                      ),
                      SocialMediaContainer(
                        title: "",
                        icon: FontAwesomeIcons.twitter,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .twitterController,
                      ),
                      SocialMediaContainer(
                        title: "",
                        icon: FontAwesomeIcons.earth,
                        controller: BlocProvider.of<AuthCubit>(context)
                            .websiteController,
                      ),
                      Gaps.vGap24,
                      SizedBox(
                        height: 44.h,
                        width: 217.w,
                        child: CustomElevatedButton(
                          text: Translation.of(context).save,
                          onTap: () {
                            if (isHasAllFiles(context)) {
                              if (BlocProvider.of<AuthCubit>(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<AuthCubit>(context).createShop(
                                    context, widget.userType, widget.phone);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          trans.please_pick_all_img_files)));
                            }
                          },
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
          },
        ),
      ),
    );
  }

  uploadSignUpFile({
    required void Function()? onTap,
    required String text,
    required File file,
  }) {
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
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isHasAllFiles(BuildContext context) {
    return BlocProvider.of<AuthCubit>(context).fileLogoAr != null &&
        BlocProvider.of<AuthCubit>(context).fileLogoEn != null &&
        BlocProvider.of<AuthCubit>(context).fileCoveAr != null &&
        BlocProvider.of<AuthCubit>(context).fileCoveEn != null;
  }
}
