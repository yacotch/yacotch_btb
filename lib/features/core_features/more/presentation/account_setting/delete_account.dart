import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/utils.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/on_boarding/view/main_onboarding_view.dart';

class MoreScreenDeleteAccountButton extends StatelessWidget {
  const MoreScreenDeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (p, c) {
            if (c is MoreAccountDeletedSucc) {
              AppStorage.signOut();
              NavigationHelper.gotoAndRemove(
                  context: context, screen: const MainOnBoardingView());
            }
          },
          builder: (context, state) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => showDeleteAccountDialog(context,
            
                () => AuthCubit.of(context).deleteAccount(_getUserId(context))),
            child: Padding(
              padding: EdgeInsets.all(6.h),
              child: CustomText(
                text: LanguageHelper.getTranslation(context).delete_acc,
                fontSize: AppConstants.textSize14,
              ),
            ),
          ),
        ));
  }
}

void showDeleteAccountDialog(BuildContext context, Function deleteFunction) {
  var tr = LanguageHelper.getTranslation(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColorLight,
        content: Text(tr.delete_acc_dialog_content),
        actions: [
          TextButton(
            onPressed: () {
              deleteFunction();
              Navigator.of(context).pop();
            },
            child: Text(
              tr.confirm,
              style: const TextStyle(color: AppColors.lightGrey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(tr.cancel),
          ),
        ],
      );
    },
  );
}

int _getUserId(BuildContext context) {
  var result = AppStorage.getUserInfo!.result!;
  if (result.restaurantId != null) return result.restaurantId!;
  if (result.shopId != null) return result.shopId!;
  return result.userId!;
}
