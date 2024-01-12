import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/features/core_features/navigator_home/widgets/add_button.dart';
import 'package:trainee_restaurantapp/features/core_features/navigator_home/widgets/items_list.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app/app_constants.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar(this.onTap, this.selected, this.homeType,
      {super.key});
  final Function(int index) onTap;
  final int selected, homeType;
  @override
  Widget build(BuildContext context) {
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
                child: _ItemsBox(
                    onTap: onTap, selected: selected, homeType: homeType),
              ),
              Expanded(child: HomeAddButton(homeType: homeType)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemsBox extends StatelessWidget {
  const _ItemsBox({
    required this.onTap,
    required this.selected,
    required this.homeType,
  });

  final Function(int index) onTap;
  final int selected;
  final int homeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(color: AppColors.primaryColorLight),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.transparent.withOpacity(0.3),
                AppColors.transparent.withOpacity(0)
              ]),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppConstants.textSize12))),
          child: BottomNavigationItemsList(
              onTap: onTap, selected: selected, homeType: homeType)),
    );
  }
}
