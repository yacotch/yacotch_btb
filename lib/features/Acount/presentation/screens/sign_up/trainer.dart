import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/style/dimens.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/Acount/data/models/specialization_model.dart';
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

class RegisterTrainerScreenView extends StatefulWidget {
  const RegisterTrainerScreenView({super.key, required this.userType});

  final int userType;

  @override
  State<RegisterTrainerScreenView> createState() =>
      _RegisterTrainerScreenViewState();
}

class _RegisterTrainerScreenViewState extends State<RegisterTrainerScreenView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..getSpecialization(),
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous != current ||
            current is RegisterTrainerLoaded ||
            current is RegisterTrainerLoading ||
            current is PasswordSecureState,
        builder: (context, state) {
          return GeneralAuthScreen(
            additionalText: Translation.of(context).account_exist,
            onButtonTap: () {
              AuthCubit.of(context).registerTrainer(context, widget.userType);
            },
            additionalTapText: Translation.of(context).login2,
            buttonText: Translation.of(context).signUp,
            isloading: AuthCubit.of(context).isLoading,
            appBar: TransparentAppBar(
              title: Translation.of(context).signUp,
            ),
            onAdditionalTextTapped: _offToLoginScreen,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: AuthCubit.of(context).formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 0.16.sh),
                    //phone number and country flag
                    PhoneNumberTextField(
                      onInputChanged: (code) =>
                          AuthCubit.of(context).countryCode = code,
                      textEditingController:
                          AuthCubit.of(context).phoneController,
                      isoCode: AuthCubit.of(context).countryCode,
                    ),
                    Gaps.vGap8,
                    //name
                    EmailTextField(
                      text: Translation.of(context).userName,
                      textInputAction: TextInputAction.next,
                      controller: AuthCubit.of(context).nameController,
                    ),
                    Gaps.vGap8,
                    // EmailTextField(
                    //   text: Translation.of(context).idNumber,
                    //   onFiledSubmitted: () {
                    //     FocusScope.of(context).requestFocus(hourRate);
                    //   },
                    //   textInputAction: TextInputAction.next,
                    //   controller: idController,
                    //   focusNode: idNumber,
                    // ),
                    // Gaps.vGap8,
                    // EmailTextField(
                    //   text: Translation.of(context).hourRate,
                    //   onFiledSubmitted: () {
                    //     FocusScope.of(context).requestFocus(coatchSpecialist);
                    //   },
                    //   textInputAction: TextInputAction.next,
                    //   controller: hourRateController,
                    //   focusNode: hourRate,
                    // ),
                    // Gaps.vGap8,
                    // EmailTextField(
                    //   text: Translation.of(context).coach_specialization,
                    //   onFiledSubmitted: () {
                    //     FocusScope.of(context).requestFocus(passwordFocusNode);
                    //   },
                    //   textInputAction: TextInputAction.next,
                    //   controller: coatchSpecialistController,
                    //   focusNode: coatchSpecialist,
                    // ),
                    const TraninerTypesDropDown(), Gaps.vGap8,
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
            ),
          );
        },
      ),
    );
  }

  _offToLoginScreen() {
    Navigator.pop(context);
  }

  uploadSignUpFile({required void Function()? onTap, required String text}) {
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
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.upload,
                      color: AppColors.accentColorLight,
                      size: Dimens.dp40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TraninerTypesDropDown extends StatefulWidget {
  const TraninerTypesDropDown({super.key});

  @override
  State<TraninerTypesDropDown> createState() => _TraninerTypesDropDownState();
}

class _TraninerTypesDropDownState extends State<TraninerTypesDropDown> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context, listen: false).getSpecialization();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Items>(
      isExpanded: true,
      value: AuthCubit.of(context).dropdownValueCate,
      hint: Text(
        LanguageHelper.getTranslation(context).choose_category,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      dropdownColor: Colors.grey,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (Items? value) {
        setState(() {
          AuthCubit.of(context).dropdownValueCate = value!;
        });
      },
      items: AuthCubit.of(context)
          .listSpecialization
          .map<DropdownMenuItem<Items>>((Items value) {
        return DropdownMenuItem<Items>(
          value: value,
          child: Text(
            value.name ?? '',
          ),
        );
      }).toList(),
    );
  }
}
