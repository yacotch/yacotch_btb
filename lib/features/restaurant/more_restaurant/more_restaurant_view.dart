import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/widgets/chip.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_orders_restaurant/view/my_order_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_plates/view/all_plates_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/view/subscription_screen.dart';
import '../../../../../core/constants/app/app_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreRestaurantScreen extends StatelessWidget {
  const MoreRestaurantScreen({Key? key, required this.typeUser})
      : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return MoreScreen(typeUser: typeUser, data: _getData(context, typeUser));
  }
}

_getData(BuildContext context, int typeUser) {
  var tr = LanguageHelper.getTranslation(context);

  return List.generate(
      4,
      (index) => MoreChipEntity(
          title: _getTitle(tr, index),
          imgPath: _getImagePath(index),
          onPressed: () => NavigationHelper.goto(
              context: context, screen: _getScreen(index, typeUser))));
}

Widget _getScreen(int index, int typeUser) {
  return [
    const AllPlatesScreen(),
    const MyOrderRestaurantView(),
    SubscriptionScreen(typeUser: typeUser),
  ][index];
}

String _getImagePath(int index) {
  return [
    AppConstants.SWIMMING_IMG,
    AppConstants.MOTCHY2_IMG,
    AppConstants.VEGGIE2_IMG
  ][index];
}

String _getTitle(AppLocalizations tr, int index) {
  return [
    tr.my_plates,
    tr.my_orders,
    tr.bouquet,
  ][index];
}
