import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/most_wanted_product/product_entity.dart';
import 'package:trainee_restaurantapp/features/restaurant/home_restaurant/data/models/dish_model.dart';

class ProductItemWidget extends StatelessWidget {
  final Function() ontap;
  final ProductEntity item;
  const ProductItemWidget({
    required this.ontap,
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => ontap()

      //  NavigationHelper.goto(screen: MyProductDetails(productId: item.id!), context: context);
      ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
            image: DecorationImage(
              image:
                  NetworkImage(item.images!.isEmpty ? '' : item.images!.first),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 90.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: BlurWidget(
                      blurColor: AppColors.grey.withOpacity(0.5),
                      height: 100.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, top: 14.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _Name(item.name),
                                Gaps.hGap4,
                                _OrdersNumber( item.numOfOrders),
                              ],
                            ),
                          ),
                          _Price(price: item.price),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final int? price;
  const _Price({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 4.h),
      child: CustomText(
        text:
            "${price ?? 0} ${LanguageHelper.getTranslation(context).saudi_riyal}",
        fontWeight: FontWeight.w600,
        color: AppColors.accentColorLight,
        fontSize: AppConstants.textSize12,
      ),
    );
  }
}

class _OrdersNumber extends StatelessWidget {
  final int? num;
  const _OrdersNumber(this.num);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.cube,
          size: 16,
          color: AppColors.accentColorLight,
        ),
        SizedBox(
          height: 10,
          child: CustomText(
            text:
                " ${num ?? 0} ${LanguageHelper.getTranslation(context).order}",
            fontWeight: FontWeight.w500,
            fontSize: AppConstants.textSize12,
          ),
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final String? name;
  const _Name(this.name);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .3.sw,
      child: CustomText(
        text: name ?? LanguageHelper.getTranslation(context).no_data_found,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        fontSize: AppConstants.textSize14,
        textAlign: TextAlign.start,
        maxLines: 2,
      ),
    );
  }
}
