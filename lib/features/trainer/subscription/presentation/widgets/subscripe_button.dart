import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/models/subscription_model.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/controller/auth_cubit.dart';
import 'package:trainee_restaurantapp/features/navigator_home/view/navigator_home_view.dart';
import 'package:trainee_restaurantapp/features/payment/view/payment_view.dart';

class SubscripeButton extends StatelessWidget {
  const SubscripeButton({
    super.key,
    required this.subscriptionModel,
    required this.typeUser,
  });

  final SubscriptionModel subscriptionModel;
  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () {
          if (subscriptionModel.fee == 0.0) {
            AuthCubit.of(context).assignSubscriptionToUser(context, typeUser);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => NavigatorScreen(
                    homeType: typeUser,
                  ),
                ),
                (route) => false);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentView(
                    amount: subscriptionModel.fee ?? 0.0,
                    userId: AppStorage.getUserId,
                    typeUser: typeUser,
                    subscriptionId: subscriptionModel.id!),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          color: AppColors.accentColorLight,
          child: const Text(
            "اشتراك",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
