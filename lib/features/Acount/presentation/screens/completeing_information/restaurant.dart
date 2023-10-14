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
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text_field.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

class CreateRestaurantScreen extends StatefulWidget {
  final String phone, email, passsword;
  final int userType;

  const CreateRestaurantScreen(
      {super.key,
      required this.phone,
      required this.email,
      required this.passsword,
      required this.userType});

  @override
  State<CreateRestaurantScreen> createState() => _CreateRestaurantScreenState();
}

class _CreateRestaurantScreenState extends State<CreateRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    var trans = LanguageHelper.getTranslation(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: TransparentAppBar(title: trans.restaurant),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SizedBox(
              height: 1.sh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: AuthCubit.of(context).formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 55.h),

                        _buildTextFiledWidget(
                            type: TextInputType.name,
                            validator: (input) => !Validators.isArabic(input!)
                                ? trans.enter_at_letters
                                : null,
                            title: trans.rest_name_ar,
                            textEditingController:
                                AuthCubit.of(context).nameArController),
                        Gaps.vGap24,
                        _buildTextFiledWidget(
                            type: TextInputType.name,
                            validator: (input) => !Validators.isEnglish(input!)
                                ? trans.enter_eng_letters
                                : null,
                            title: trans.rest_name_en,
                            textEditingController:
                                AuthCubit.of(context).nameEnController),
                        Gaps.vGap24,
                        uploadSignUpFile(
                            text: trans.logo_ar,
                            file: AuthCubit.of(context).fileLogoAr ?? File(''),
                            onTap: () async =>
                                AuthCubit.of(context).pickLogoAr()),
                        Gaps.vGap8,
                        uploadSignUpFile(
                          text: trans.logo_en,
                          file: AuthCubit.of(context).fileLogoEn ?? File(''),
                          onTap: () async => AuthCubit.of(context).pickLogoEn(),
                        ),
                        Gaps.vGap8,
                        uploadSignUpFile(
                            text: trans.cover_en,
                            file: AuthCubit.of(context).fileCoveEn ?? File(''),
                            onTap: () async =>
                                await AuthCubit.of(context).pickCoverEn()),
                        Gaps.vGap8,
                        uploadSignUpFile(
                            text: trans.cover_ar,
                            file: AuthCubit.of(context).fileCoveAr ?? File(''),
                            onTap: () async =>
                                await AuthCubit.of(context).pickCoverAr()),
                        _buildTextFiledWidget(
                            type: TextInputType.number,
                            validator: (input) =>
                                Validators.isNumber(input!, context),
                            title: Translation.of(context).phone,
                            isPhoneNumber: true,
                            textEditingController:
                                AuthCubit.of(context).phoneController),
                        Gaps.vGap24,
                        _buildTextFiledWidget(
                          type: TextInputType.number,
                          validator: (input) =>
                              Validators.isNumber(input!, context),
                          title: LanguageHelper.getTranslation(context)
                              .commericalNumber,
                          textEditingController:
                              BlocProvider.of<AuthCubit>(context)
                                  .commercialRegisterNumberController,
                        ),
                        Gaps.vGap24,
                        uploadSignUpFile(
                          text: LanguageHelper.getTranslation(context)
                              .commericalFile,
                          file:
                              AuthCubit.of(context).fileCommercialRegisterDoc ??
                                  File(''),
                          onTap: () async =>
                              await AuthCubit.of(context).pickCommericalDoc(),
                        ),
                        Gaps.vGap8,
                        _buildTextFiledWidget(
                            type: TextInputType.name,
                            validator: (input) => !Validators.isArabic(input!)
                                ? trans.enter_at_letters
                                : null,
                            title: LanguageHelper.getTranslation(context)
                                .course_details_ar,
                            textEditingController:
                                AuthCubit.of(context).descArController),
                        Gaps.vGap24,
                        _buildTextFiledWidget(
                            type: TextInputType.name,
                            validator: (input) => !Validators.isEnglish(input!)
                                ? trans.enter_eng_letters
                                : null,
                            title: trans.course_details_en,
                            textEditingController:
                                AuthCubit.of(context).descEnController),
                        Gaps.vGap24,
                        _buildTextFiledWidget(
                            type: TextInputType.name,
                            validator: (input) =>
                                !Validators.isNotEmptyString(input!)
                                    ? trans.errorEmptyField
                                    : null,
                            title: LanguageHelper.getTranslation(context)
                                .restaurantOwner,
                            textEditingController:
                                AuthCubit.of(context).mangerController),
                        Gaps.vGap24,
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                AuthCubit.of(context).onLocationClick(context);
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
                        _buildSocialMediaContainer(
                            title: trans.social_media_links,
                            controller:
                                AuthCubit.of(context).facebookController,
                            icon: FontAwesomeIcons.squareFacebook),
                        _buildSocialMediaContainer(
                          title: "",
                          icon: FontAwesomeIcons.instagram,
                          controller: AuthCubit.of(context).instegramController,
                        ),
                        _buildSocialMediaContainer(
                          title: "",
                          icon: FontAwesomeIcons.twitter,
                          controller: AuthCubit.of(context).twitterController,
                        ),
                        _buildSocialMediaContainer(
                          title: "",
                          icon: FontAwesomeIcons.earth,
                          controller: AuthCubit.of(context).websiteController,
                        ),
                        Gaps.vGap24,
                        // _addWorkingHours(),
                        Gaps.vGap24,
                        SizedBox(
                          height: 44.h,
                          width: 217.w,
                          child: state is RegisterRestaurantLoading ||
                                  state is UploadImageLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomElevatedButton(
                                  text: Translation.of(context).save,
                                  onTap: () {
                                    if (isHasAllFiles(context)) {
                                      print(AuthCubit.of(context)
                                          .formKey
                                          .currentState!
                                          .validate());
                                      if (AuthCubit.of(context)
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        print("validate");
                                        //todo
                                        //need to add a manager email field
                                        AuthCubit.of(context).createRestaurant(
                                            email: "widget@gmail.com",
                                            password: widget.passsword,
                                            context,
                                            commerical: BlocProvider.of<
                                                    AuthCubit>(context)
                                                .commercialRegisterNumberController
                                                .text,
                                            widget.userType,
                                            widget.phone);
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(trans
                                                  .please_pick_all_img_files)));
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
              ),
            );
          },
        ),
      ),
    );
  }

  bool isHasAllFiles(BuildContext context) {
    return AuthCubit.of(context).fileCommercialRegisterDoc != null &&
        AuthCubit.of(context).fileLogoAr != null &&
        AuthCubit.of(context).fileLogoEn != null &&
        AuthCubit.of(context).fileCoveAr != null &&
        AuthCubit.of(context).fileCoveEn != null;
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

  Widget _buildSocialMediaContainer(
      {required String title,
      required IconData icon,
      required TextEditingController controller}) {
    return Row(
      // textDirection: TextDirection.LTR,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: _buildTextFiledWidget(
              type: TextInputType.name,
              validator: (input) => !Validators.isNotEmptyString(input!)
                  ? LanguageHelper.getTranslation(context).errorEmptyField
                  : null,
              title: title,
              textEditingController: controller),
        ),
        Gaps.hGap8,
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 20,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(
                  icon,
                  color: AppColors.accentColorLight,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFiledWidget(
      {required String title,
      bool isPhoneNumber = false,
      required TextInputType type,
      required TextEditingController textEditingController,
      required Function(String? input) validator}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppConstants.textSize16,
        ),
        Gaps.vGap4,
        isPhoneNumber
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.white,
                    ),
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: PhoneNumberTextField(
                    border: InputBorder.none,
                    hint: "",
                    textEditingController: textEditingController,
                    onInputChanged: (p0) {},
                  ),
                ),
              )
            : TextFormField(
                controller: textEditingController,
                validator: (value) => validator(value),
                keyboardType: type,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.white,
                  )),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.white,
                  )),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.white,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.white,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.white,
                  )),
                ),
              ),
      ],
    );
  }
}
