import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/most_wanted_product/list.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/most_wanted_product/product_entity.dart';
import 'package:trainee_restaurantapp/features/shop/home_shop/controller/home_shop_cubit.dart';
import 'package:trainee_restaurantapp/features/shop/my_products/view/all_products_screen.dart';
import 'package:trainee_restaurantapp/features/shop/my_products/view/product_details_view.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/ui/loader.dart';
import '../../../../core/ui/widgets/title_widget.dart';
import '../../../trainer/subscription/presentation/view/subscription_screen.dart';
import '../../../trainer/trainee/presentation/view/trainee_profile_view.dart';
import '../../shop_profile/shop_profile_controller/shop_profile_cubit.dart';

class HomeShopScreen extends StatefulWidget {
  const HomeShopScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  State<HomeShopScreen> createState() => _HomeShopScreenState();
}

class _HomeShopScreenState extends State<HomeShopScreen> {
  Widget restaurantBouquet() {
    return BlocBuilder<ShopProfileCubit, ShopProfileState>(
        builder: (context, state) {
      if (state is GetShopProfileLoading) {
        return const Loader();
      } else {
        var restaurantsModel = ShopProfileCubit.of(context).shopModel;
        return restaurantsModel!.subscription != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100.h,
                  child: Column(
                    children: [
                      TitleWidget(
                        title: LanguageHelper.getTranslation(context)
                            .subscription_plan,
                        subtitleColorTapped: () {},
                        subtitle: "",
                        titleColor: AppColors.accentColorLight,
                      ),
                      Gaps.vGap14,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppConstants.borderRadius10)),
                                    gradient: const LinearGradient(colors: [
                                      AppColors.lightColor,
                                      AppColors.accentColorLight
                                    ])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: restaurantsModel!
                                                .subscription!.name ??
                                            '',
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: AppConstants.textSize16,
                                      ),
                                      CustomText(
                                        text:
                                            "${restaurantsModel.subscription!.fee ?? 0} ${LanguageHelper.getTranslation(context).saudi_riyal}",
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                        fontSize: AppConstants.textSize16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gaps.hGap16,
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.transparent
                                            .withOpacity(0.2)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            AppConstants.blurDegree10)),
                                    gradient: LinearGradient(colors: [
                                      AppColors.transparent.withOpacity(0.0),
                                      AppColors.transparent.withOpacity(0.5)
                                    ])),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {
                                      NavigationHelper.goto(
                                          screen: SubscriptionScreen(
                                              typeUser: widget.typeUser),
                                          context: context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox();
      }
    });
  }

  @override
  void initState() {
    ShopProfileCubit.of(context).getShopProfile(context);
    super.initState();
  }

  Widget _buildSubscriptionWidget() {
    return BlocBuilder<ShopProfileCubit, ShopProfileState>(
      builder: (context, state) {
        if (state is GetShopProfileLoading) {
          return const Loader();
        } else {
          var shopModel = ShopProfileCubit.of(context).shopModel;
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          gradient: LinearGradient(colors: [
                            AppColors.grey.withOpacity(0.9),
                            AppColors.grey.withOpacity(1),
                          ]),
                          borderRadius: BorderRadius.circular(
                              AppConstants.borderRadius10)),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: shopModel?.logo == null
                                    ? const DecorationImage(
                                        image:
                                            AssetImage(AppConstants.AVATER_IMG),
                                        fit: BoxFit.fill)
                                    : DecorationImage(
                                        image:
                                            NetworkImage(shopModel?.logo ?? ''),
                                        fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                      text: shopModel?.name ?? "",
                                      color: AppColors.white,
                                      fontSize: AppConstants.textSize14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: shopModel?.subscription?.name ?? "",
                                      color: AppColors.accentColorLight,
                                      fontSize: AppConstants.textSize14,
                                      fontWeight: FontWeight.w600,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeShopCubit()..getAllProductMostOrderedHome(),
      child: BlocBuilder<ShopProfileCubit, ShopProfileState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is GetShopProfileLoading ||
              state is GetAllProductMostOrderedHomeLoading) {
            return const Loader();
          } else {
            var shopModel = ShopProfileCubit.of(context).shopModel;
            return SafeArea(
              child: CustomScrollView(slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomSliverDelegate(
                    latitude: shopModel!.latitude == null
                        ? 30.033333
                        : shopModel.latitude!.toDouble(),
                    longitude: shopModel.longitude == null
                        ? 30.033333
                        : shopModel.longitude!.toDouble(),
                    expandedHeight: 230.h,
                    child: _buildSubscriptionWidget(),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        BlocBuilder<HomeShopCubit, HomeShopState>(
                          builder: (context, state) {
                            if (state is GetAllProductMostOrderedHomeLoaded) {
                              return const _WantedProducts();
                            }
                            return const SizedBox(
                              height: 350,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                        Gaps.vGap16,
                        restaurantBouquet(),
                        Gaps.vGap60,
                      ],
                    ),
                  ),
                ),
              ]),
            );
          }
        },
      ),
    );
  }
}

class _WantedProducts extends StatelessWidget {
  const _WantedProducts();

  @override
  Widget build(BuildContext context) {
    return MostWantedProducts(
        getDeatilsScreen: (index) => MyProductDetails(
            productId: HomeShopCubit.of(context).listOfProduct[index].id!),
        allProductsScreen: AllProductsScreen(),
        title: LanguageHelper.getTranslation(context).most_wanted_products,
        HomeShopCubit.of(context)
            .listOfProduct
            .map((e) => ProductEntity(
                id: e.id,
                images: e.images,
                name: e.name,
                numOfOrders: e.orderCount,
                price: e.price))
            .toList());
  }
}
