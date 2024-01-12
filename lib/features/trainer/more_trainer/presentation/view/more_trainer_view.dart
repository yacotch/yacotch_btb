import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/more_screen.dart';
import 'package:trainee_restaurantapp/features/core_features/more/presentation/widgets/chip.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/view/my_course_view.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/my_order_view.dart';
import 'package:trainee_restaurantapp/features/trainer/trainee/presentation/view/all_trainee_screen.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../subscription/presentation/view/subscription_screen.dart';

class MoreTrainerScreen extends StatelessWidget {
  const MoreTrainerScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    var tr = LanguageHelper.getTranslation(context);
    return MoreScreen(
        typeUser: typeUser,
        data: List.generate(
            4,
            (index) => MoreChipEntity(
                title: _getTitle(tr, index),
                imgPath: _getImagePath(index),
                onPressed: () => NavigationHelper.goto(
                    context: context, screen: _getScreen(index)))));
  }

  Widget _getScreen(int index) {
    return [
      const MyCoursesView(),
      const AllTraineeScreen(),
      const MyOrderView(),
      SubscriptionScreen(
        typeUser: typeUser,
      ),
    ][index];
  }

  String _getImagePath(int index) {
    return [
      AppConstants.SWIMMING_IMG,
      AppConstants.COACH1_IMAGE,
      AppConstants.MOTCHY2_IMG,
      AppConstants.VEGGIE2_IMG
    ][index];
  }

  String _getTitle(AppLocalizations tr, int index) {
    return [
      tr.courses,
      tr.trainee,
      tr.my_booking,
      tr.subscription_plans
    ][index];
  }
}
