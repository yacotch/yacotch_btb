import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/navigation/route_generator.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/navigator_home/widgets/bottom_item.dart';
import 'package:trainee_restaurantapp/features/restaurant/home_restaurant/view/home_restaurant_view.dart';
import 'package:trainee_restaurantapp/features/shop/add_product/view/add_product_view.dart';
import 'package:trainee_restaurantapp/features/shop/my_orders_shop/view/my_order_shop_view.dart';
import 'package:trainee_restaurantapp/features/shop/shop_profile/view/shop_profile.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/screen/add_course_view.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/route_aware_widget.dart';
import '../../../../generated/l10n.dart';
import '../../restaurant/add_plate/view/add_plate_view.dart';
import '../../restaurant/more_restaurant/more_restaurant_view.dart';
import '../../restaurant/my_orders_restaurant/view/my_order_restaurant_view.dart';
import '../../restaurant/restaurant_profile/view/restaurant_profile.dart';
import '../../shop/home_shop/view/home_shop_view.dart';
import '../../shop/more_shop/more_shop_view.dart';
import '../../trainer/chat/view/chat_view.dart';
import '../../trainer/home_trainer/presentation/view/home_trainer_view.dart';
import '../../trainer/more_trainer/presentation/view/more_trainer_view.dart';
import '../../trainer/profile_details/presentation/view/profile_view_screen.dart';

class NavigatorScreen extends StatefulWidget {
  static const String routeName = "NavigatorScreen/";
  int homeType;

  NavigatorScreen({Key? key, required this.homeType}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends RouteAwareState<NavigatorScreen> {
  late List<Widget> _pages;

  late PageController _pageController;
  int _selectedPage = 0;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  bool _inScreen = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pages = widget.homeType == 1
        ? [
            HomeTrainerScreen(typeUser: widget.homeType),
            const ChatView(),
            const ProfileTrainerScreenView(),
            MoreTrainerScreen(typeUser: widget.homeType),
          ]
        : widget.homeType == 3
            ? [
                HomeRestaurantScreen(typeUser: widget.homeType),
                const MyOrderRestaurantView(),
                const RestaurantProfile(),
                MoreRestaurantScreen(typeUser: widget.homeType),
              ]
            : [
                HomeShopScreen(
                  typeUser: widget.homeType,
                ),
                const MyOrderShopView(),
                const ShopProfile(),
                MoreShopScreen(
                  typeUser: widget.homeType,
                ),
              ];
  }

  Widget _buildBottomNavigationBar() {
    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: 1.sw,
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColorLight,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConstants.textSize12))),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.transparent.withOpacity(0.3),
                            AppColors.transparent.withOpacity(0)
                          ]),
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstants.textSize12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            //home
                           
                          InkWell(
                           onTap: () {
                              _onItemTapped(0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ImageIcon(
                                    const AssetImage(
                                      AppConstants.HOME_ICON,
                                    ),
                                    color: _selectedPage == 0
                                        ? AppColors.accentColorLight
                                        : AppColors.white,
                                    size: AppConstants.textSize18.h,
                                  ),
                                  CustomText(
                                    text: Translation.of(context).homePage,
                                    color: _selectedPage == 0
                                        ? AppColors.accentColorLight
                                        : AppColors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          widget.homeType == 3
                              ? CustomButtomNavigationItem(
                                  onTap: (index) => _onItemTapped(index),
                                  icon: AppConstants.MAIL_ICON,
                                  text: Translation.of(context).myOrder,
                                  index: 1,
                                  selectedIndex: _selectedPage)
                              : CustomButtomNavigationItem(
                                  onTap: (index) => _onItemTapped(index),
                                  icon: AppConstants.MAIL_ICON,
                                  text: LanguageHelper.getTranslation(context)
                                      .chats,
                                  index: 1,
                                  selectedIndex: _selectedPage),
                          CustomButtomNavigationItem(
                              onTap: (index) => _onItemTapped(index),
                              icon: AppConstants.PROFILE_ICON,
                              text: Translation.of(context).profile,
                              index: 2,
                              selectedIndex: _selectedPage),
                          CustomButtomNavigationItem(
                              onTap: (index) => _onItemTapped(index),
                              iconData: Icons.more_horiz,
                              text: Translation.of(context).more,
                              index: 3,
                              selectedIndex: _selectedPage),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColorLight,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (widget.homeType == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddPlateView()));
                      } else if (widget.homeType == 4) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddProductView()));
                      } else {
                        NavigationHelper.goto(
                            screen: const AddCourseView(), context: context);
                      }
                    },
                    child: Container(
                      width: double.minPositive,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.transparent.withOpacity(0.2)),
                        gradient: LinearGradient(colors: [
                          AppColors.transparent.withOpacity(0.3),
                          AppColors.transparent.withOpacity(0)
                        ]),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.add,
                          color: AppColors.accentColorLight,
                        ),
                      ),
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

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedPage = index;
      //
      //
      //using this page controller you can make beautiful animation effects
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  void _onDynamicLinkExists(String? id) {
    //Provider.of<SessionDataProvider>(context, listen: false).sharedStoryId = id;

    if (_inScreen) {
      _onItemTapped(2);
    } else {
      Nav.off(NavigatorScreen.routeName, cleanHistory: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedPage = value;
                });
              },
              children: _pages,
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void onEnterScreen() {
    // TODO: implement onEnterScreen
  }

  @override
  void onLeaveScreen() {
    setState(() {
      _inScreen = false;
    });
  }
}
