import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/widgets/chip.dart';
import 'package:trainee_restaurantapp/features/shop/my_orders_shop/view/my_order_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/my_products/view/all_products_screen.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../trainer/subscription/presentation/view/subscription_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreShopScreen extends StatelessWidget {
  const MoreShopScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return MoreScreen(
      typeUser: typeUser,
      data: _getData(context, typeUser),
    );
  }
}

_getData(BuildContext context, int typeUser) {
  var tr = LanguageHelper.getTranslation(context);

  return List.generate(
      3,
      (index) => MoreChipEntity(
          title: _getTitle(tr, index),
          imgPath: _getImagePath(index),
          onPressed: () => NavigationHelper.goto(
              context: context, screen: _getScreen(index, typeUser))));
}

Widget _getScreen(int index, int typeUser) {
  return [
    const AllProductsScreen(),
    const MyOrderShopView(),
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
    tr.my_products,
    tr.my_orders,
    tr.bouquet,
  ][index];
}
