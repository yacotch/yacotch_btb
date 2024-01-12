import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/widgets/chip.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_orders_restaurant/view/my_order_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_plates/view/all_plates_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/view/subscription_screen.dart';
import '../../../../../core/constants/app/app_constants.dart';

class MoreRestaurantScreen extends StatelessWidget {
  const MoreRestaurantScreen({Key? key, required this.typeUser})
      : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return MoreScreen(typeUser: typeUser, child: _Content(typeUser: typeUser));
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.typeUser});

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoreCustomChipWidget(
            title: tr.my_plates,
            imgPath: AppConstants.SWIMMING_IMG,
            onPressed: () => NavigationHelper.goto(
                context: context, screen: const AllPlatesScreen())),
        MoreCustomChipWidget(
            title: tr.my_orders,
            imgPath: AppConstants.MOTCHY2_IMG,
            onPressed: () => NavigationHelper.goto(
                context: context, screen: const MyOrderRestaurantView())),
        MoreCustomChipWidget(
            title: tr.bouquet,
            imgPath: AppConstants.VEGGIE2_IMG,
            onPressed: () => NavigationHelper.goto(
                context: context,
                screen: SubscriptionScreen(typeUser: typeUser))),
      ],
    );
  }
}
