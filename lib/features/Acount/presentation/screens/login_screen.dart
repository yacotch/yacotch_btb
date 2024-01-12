import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/sign_up/restaurant.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/sign_up/shop.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/sign_up/trainer.dart';
import 'package:trainee_restaurantapp/features/core_features/main_onboarding_view.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import 'forget_password.dart';
import 'general_auth.dart';

class LoginScreen extends StatefulWidget {
  final int userType;
  const LoginScreen(this.userType, {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _login(BuildContext context) {
    AuthCubit.of(context).login(context, widget.userType);
  }

  void _toForgotPassword() {
    NavigationHelper.goto(
        screen: ForgotPasswordScreenContent(userType: widget.userType),
        context: context);
  }

  void _offToSignupScreen() {
    NavigationHelper.goto(
        screen: widget.userType == 1
            ? const RegisterTrainerScreenView(userType: 1)
            : widget.userType == 3
                ? const RegisterRestaurantScreenView(userType: 3)
                : const RegisterShopScreenView(userType: 4),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous != current ||
            current is LoginLoaded ||
            current is LoginLoading ||
            current is PasswordSecureState,
        builder: (context, state) {
          return GeneralAuthScreen(
            appBar: TransparentAppBar(
              title: Translation.of(context).login,
            ),
            buttonText: Translation.of(context).login,
            additionalText: Translation.of(context).no_account,
            additionalTapText: Translation.of(context).signup2,
            isloading: AuthCubit.of(context).isLoading,
            onButtonTap: () => _login(context),
            onAdditionalTextTapped: _offToSignupScreen,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: AuthCubit.of(context).formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 0.16.sh,
                    ),
                    PhoneNumberTextField(
                      onInputChanged: (code) {
                        return AuthCubit.of(context).countryCode = code;
                      },
                      textEditingController:
                          AuthCubit.of(context).phoneController,
                      isoCode: AuthCubit.of(context).countryCode,
                      textInputAction: TextInputAction.next,
                    ),
                    Gaps.vGap8,
                    PasswordTextField(
                      controller: AuthCubit.of(context).passwordController,
                      passwordSecure: AuthCubit.of(context).passwordSecure,
                      textInputAction: TextInputAction.done,
                      onFiledSubmitted: () {
                        _login(context);
                      },
                      hidePassword: (bool) {
                        AuthCubit.of(context).passwordSecure = bool;
                        AuthCubit.of(context).emit(PasswordSecureState());
                      },
                    ),
                    Gaps.vGap14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _toForgotPassword,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CustomText(
                              text: Translation.of(context).forgot_password,
                              color: AppColors.accentColorLight,
                              fontSize: AppConstants.textSize14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
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
}
