import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/core_features/navigator_home/widgets/bottom_item.dart';
import '../../../../../core/constants/app/app_constants.dart';

class BottomNavigationItemsList extends StatelessWidget {
  const BottomNavigationItemsList({
    super.key,
    required this.onTap,
    required this.selected,
    required this.homeType,
  });

  final Function(int index) onTap;
  final int selected;
  final int homeType;

  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CustomButtomNavigationItem(
        onTap: (index) => onTap(index),
        selectedIndex: selected,
        text: _getTitle(tr, index),
        index: index,
        icon: _getImagesPath(index),
        iconData: index == 3 ? Icons.more_horiz : null,
      ),
    );
  }

  String? _getImagesPath(int index) {
    return [
      AppConstants.HOME_ICON,
      AppConstants.MAIL_ICON,
      AppConstants.PROFILE_ICON,
      null
    ][index];
  }

  String _getTitle(AppLocalizations tr, int index) {
    return [
      tr.homePage,
      homeType == 3 ? tr.myOrder : tr.chats,
      tr.profile,
      tr.more
    ][index];
  }
}
