import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/widgets/chip.dart';
import 'package:trainee_restaurantapp/features/shop/my_orders_shop/view/my_order_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/my_products/view/all_products_screen.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../generated/l10n.dart';
import '../../trainer/subscription/presentation/view/subscription_screen.dart';

class MoreShopScreen extends StatelessWidget {
  const MoreShopScreen({Key? key, required this.typeUser}) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MoreCustomChipWidget(
          title: LanguageHelper.getTranslation(context).my_products,
          imgPath: AppConstants.SWIMMING_IMG,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AllProductsScreen()));
          },
        ),
        MoreCustomChipWidget(
          title: Translation.of(context).my_orders,
          imgPath: AppConstants.MOTCHY2_IMG,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyOrderShopView()));
          },
        ),
        MoreCustomChipWidget(
          title: Translation.of(context).bouquet,
          imgPath: AppConstants.VEGGIE2_IMG,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubscriptionScreen(typeUser: typeUser)));
          },
        ),
      ],
    );
  }
}
