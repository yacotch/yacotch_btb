import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../controller/auth_cubit.dart';
import 'general_auth.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key, required this.screenNumber})
      : super(key: key);

  final int screenNumber;

  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous != current || current is PasswordSecureState,
        builder: (context, state) {
          return GeneralAuthScreen(
            appBar: TransparentAppBar(title: tr.change_password),
            buttonText: tr.change,
            additionalText: '',
            additionalTapText: '',
            isloading: AuthCubit.of(context).isLoading,
            onButtonTap: () {
              AuthCubit.of(context).changePassword(
                context,
                screenNumber,
              );
            },
            onAdditionalTextTapped: () {},
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: AuthCubit.of(context).formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.16.sh,
                    ),
                    PasswordTextField(
                      text: tr.old_pass,
                      controller: AuthCubit.of(context).passwordController,
                      passwordSecure: AuthCubit.of(context).passwordSecure,
                      textInputAction: TextInputAction.done,
                      hidePassword: (bool) {
                        AuthCubit.of(context).passwordSecure = bool;
                        AuthCubit.of(context).emit(PasswordSecureState());
                      },
                    ),
                    Gaps.vGap8,
                    PasswordTextField(
                      text: tr.new_password,
                      controller:
                          AuthCubit.of(context).confirmPasswordController,
                      passwordSecure:
                          AuthCubit.of(context).confirmPasswordSecure,
                      textInputAction: TextInputAction.done,
                      onFiledSubmitted: () {
                        AuthCubit.of(context).changePassword(
                          context,
                          screenNumber,
                        );
                      },
                      hidePassword: (bool) {
                        AuthCubit.of(context).confirmPasswordSecure = bool;
                        AuthCubit.of(context).emit(PasswordSecureState());
                      },
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
