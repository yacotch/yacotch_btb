import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/style/dimens.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/notifications/notification_service.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/general_auth.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/widgets/custom_checkBox.dart';
import '../../../../../core/ui/widgets/custom_text.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';

class RegisterShopScreenView extends StatefulWidget {
  const RegisterShopScreenView({super.key, required this.userType});

  final int userType;

  @override
  State<RegisterShopScreenView> createState() => _RegisterShopScreenViewState();
}

class _RegisterShopScreenViewState extends State<RegisterShopScreenView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous != current ||
            current is RegisterShopLoaded ||
            current is RegisterShopLoading ||
            current is PasswordSecureState ||
            current is UploadSignUpFileState,
        builder: (context, state) {
          return GeneralAuthScreen(
            additionalText: Translation.of(context).account_exist,
            onButtonTap: () => _signup(context),
            additionalTapText: Translation.of(context).login2,
            buttonText: Translation.of(context).signUp,
            isloading: state is UploadImageLoading,
            appBar: TransparentAppBar(title: Translation.of(context).signUp),
            onAdditionalTextTapped: _offToLoginScreen,
            child: Form(
              key: AuthCubit.of(context).formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: .05.sh),
                  PhoneNumberTextField(
                    onInputChanged: (code) =>
                        AuthCubit.of(context).countryCode = code,
                    textEditingController:
                        AuthCubit.of(context).phoneController,
                    isoCode: AuthCubit.of(context).countryCode,
                  ),
                  Gaps.vGap8,
                  const _EmailField(),
                  Gaps.vGap8,
                  const _ShopNameField(),
                  Gaps.vGap8,
                  EmailTextField(
                    text: Translation.of(context).commericalNumber,
                    textInputAction: TextInputAction.next,
                    keboardType: TextInputType.number,
                    controller:
                        AuthCubit.of(context).commercialNumberController,
                  ),
                  Gaps.vGap8,
                  uploadSignUpFile(
                    text: Translation.of(context).commericalFile,
                    file: AuthCubit.of(context).fileCommercialRegisterDoc,
                    onTap: () async =>
                        await AuthCubit.of(context).pickCommericalDoc(),
                  ),
                  Gaps.vGap8,
                  EmailTextField(
                    text: Translation.of(context).shopManagerName,
                    textInputAction: TextInputAction.next,
                    controller:
                        AuthCubit.of(context).restaurantManagerNameController,
                  ),
                  Gaps.vGap8,
                  PhoneNumberTextField(
                    hint: Translation.of(context).shopPhoneNumber,
                    onInputChanged: (code) =>
                        AuthCubit.of(context).countryCode = code,
                    //onDialChanged: (dial)=>countryDial=dial,
                    textEditingController:
                        AuthCubit.of(context).phoneRestaurantController,
                    isoCode: AuthCubit.of(context).countryCode,
                  ),
                  Gaps.vGap8,
                  PasswordTextField(
                    controller: AuthCubit.of(context).passwordController,
                    passwordSecure: AuthCubit.of(context).passwordSecure,
                    textInputAction: TextInputAction.next,
                    hidePassword: (bool) {
                      AuthCubit.of(context).passwordSecure = bool;
                      AuthCubit.of(context).emit(PasswordSecureState());
                    },
                  ),
                  Gaps.vGap8,
                  PasswordTextField(
                    controller: AuthCubit.of(context).confirmPasswordController,
                    passwordSecure: AuthCubit.of(context).confirmPasswordSecure,
                    textInputAction: TextInputAction.done,
                    isConfirmPassword: true,
                    otherPasswordController:
                        AuthCubit.of(context).passwordController,
                    onFiledSubmitted: () {},
                    hidePassword: (bool) {
                      AuthCubit.of(context).confirmPasswordSecure = bool;
                      AuthCubit.of(context).emit(PasswordSecureState());
                    },
                  ),
                  Gaps.vGap8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: Translation.of(context).accept_on,
                      ),
                      Gaps.hGap4,
                      CustomText(
                        text: Translation.of(context).terms,
                        color: AppColors.accentColorLight,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.bold,
                      ),
                      Gaps.hGap4,
                      CustomText(
                        text: Translation.of(context).following,
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.5,
                        child: CustomCheckbox(
                          checkColor: AppColors.white,
                          activeColor: AppColors.accentColorLight,
                          value: AuthCubit.of(context).boxChecked,
                          onChanged: (value) => setState(() {
                            AuthCubit.of(context).boxChecked = value!;
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  unFocus() {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  _signup(context) async {
    if (AuthCubit.of(context).fileCommercialRegisterDoc == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(LanguageHelper.getTranslation(context)
              .please_pick_all_img_files)));
    } else {
      if (AuthCubit.of(context).formKey.currentState!.validate()) {
        AuthCubit.of(context).registerShop(context, widget.userType);
      }
    }
  }

  _offToLoginScreen() {
    Navigator.pop(context);
  }

  uploadSignUpFile(
      {required void Function()? onTap, required String text, File? file}) {
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
                dashPattern: const [10, 3],
                radius: const Radius.circular(10),
                borderType: BorderType.Rect,
                strokeWidth: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((Dimens.dp12))),
                  height: Dimens.dp80.h,
                  width: double.infinity,
                  child: file == null
                      ? const Center(
                          child: FaIcon(
                            FontAwesomeIcons.upload,
                            color: AppColors.accentColorLight,
                            size: Dimens.dp40,
                          ),
                        )
                      : Image.file(file),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShopNameField extends StatelessWidget {
  const _ShopNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: Translation.of(context).shopName,
      textInputAction: TextInputAction.next,
      controller: AuthCubit.of(context).restaurantNameController,
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: Translation.of(context).email,
      textInputAction: TextInputAction.next,
      controller: AuthCubit.of(context).emailController,
    );
  }
}
