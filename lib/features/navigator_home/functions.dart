import 'package:trainee_restaurantapp/features/restaurant/home_restaurant/view/home_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/restaurant/more_restaurant/more_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_orders_restaurant/view/my_order_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/restaurant/restaurant_profile/view/restaurant_profile.dart';
import 'package:trainee_restaurantapp/features/shop/home_shop/view/home_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/more_shop/more_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/my_orders_shop/view/my_order_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/shop_profile/view/shop_profile.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/chat_view.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/view/home_trainer_view.dart';
import 'package:trainee_restaurantapp/features/trainer/more_trainer/view.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/view/profile_view_screen.dart';

abstract class NavigatorHomeFunctions {
  static getPages(int type) => type == 1
      ? [
          HomeTrainerScreen(typeUser: type),
          const ChatView(),
          const ProfileTrainerScreenView(),
          MoreTrainerScreen(typeUser: type),
        ]
      : type == 3
          ? [
              HomeRestaurantScreen(typeUser: type),
              const MyOrderRestaurantView(),
              const RestaurantProfile(),
              MoreRestaurantScreen(typeUser: type),
            ]
          : [
              HomeShopScreen(typeUser: type),
              const MyOrderShopView(),
              const ShopProfile(),
              MoreShopScreen(typeUser: type),
            ];
}
