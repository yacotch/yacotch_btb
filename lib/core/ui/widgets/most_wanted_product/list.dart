import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/library/carousel/custom_carousel.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/core/ui/physics/custom_scroll_physics.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/most_wanted_product/product_entity.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/most_wanted_product/product_item.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/title_widget.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_plates/view/plate_setails_view.dart';

class MostWantedProducts extends StatelessWidget {
  final List<ProductEntity> items;
  final String title;
  final Widget allProductsScreen;
  final Widget Function(int index) getDeatilsScreen;
  const MostWantedProducts(
    this.items, {
    required this.getDeatilsScreen,
    required this.title,
    required this.allProductsScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var carouselOptions = CarouselOptions(
      height: 344.h,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: false,
      scrollPhysics: const CustomScrollPhysics(itemDimension: 1),
      autoPlay: false,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          _Title(title: title, allProductsScreen: allProductsScreen),
          Gaps.vGap16,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: items.isEmpty
                  ? const _NoData()
                  : CustomCarousel(
                      items: List.generate(
                        items.length,
                        (index) => ProductItemWidget(
                          ontap: () => NavigationHelper.goto(
                            screen: getDeatilsScreen(index),
                            context: context,
                          ),
                          item: items[index],
                        ),
                      ),
                      options: carouselOptions,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoData extends StatelessWidget {
  const _NoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LanguageHelper.getTranslation(context).no_data_found),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.title,
    required this.allProductsScreen,
  });

  final String title;
  final Widget allProductsScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TitleWidget(
        title: title,
        subtitleColorTapped: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => allProductsScreen));
        },
        titleColor: AppColors.accentColorLight,
        subtitle: LanguageHelper.getTranslation(context).see_all,
      ),
    );
  }
}
