import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/navigator_home/widgets/bottom_item.dart';
import 'package:trainee_restaurantapp/features/shop/add_product/view/add_product_view.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/screen/add_course_view.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../restaurant/add_plate/view/add_plate_view.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar(this.onTap, this.selected, this.homeType,
      {super.key});
  final Function(int index) onTap;
  final int selected, homeType;
  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: 1.sw,
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                          CustomButtomNavigationItem(
                              onTap: (index) => onTap(index),
                              text: tr.homePage,
                              index: 0,
                              icon: AppConstants.HOME_ICON,
                              selectedIndex: selected),
                          CustomButtomNavigationItem(
                              onTap: (index) => onTap(index),
                              icon: AppConstants.MAIL_ICON,
                              text: homeType == 3 ? tr.myOrder : tr.chats,
                              index: 1,
                              selectedIndex: selected),
                          CustomButtomNavigationItem(
                              onTap: (index) => onTap(index),
                              icon: AppConstants.PROFILE_ICON,
                              text: tr.profile,
                              index: 2,
                              selectedIndex: selected),
                          CustomButtomNavigationItem(
                              onTap: (index) => onTap(index),
                              iconData: Icons.more_horiz,
                              text: tr.more,
                              index: 3,
                              selectedIndex: selected),
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
                      if (homeType == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddPlateView()));
                      } else if (homeType == 4) {
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
}
