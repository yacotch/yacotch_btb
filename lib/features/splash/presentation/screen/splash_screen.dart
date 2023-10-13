import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trainee_restaurantapp/core/navigation/route_generator.dart';
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/login_screen.dart';
import 'package:trainee_restaurantapp/features/navigator_home/view/navigator_home_view.dart';
import 'package:trainee_restaurantapp/features/splash/presentation/screen/splash_screen_content.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/datasources/shared_preference.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/notifications/notification_service.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final sn = HomeScreenNotifier();

  @override
  void initState() {
    setupNotifications();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (AppStorage.isLogged) {
          log("is the user was loged in ${AppStorage.isLogged}");
          if (AppStorage.getUserInfo!.result!.restaurantId != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavigatorScreen(homeType: 3),
              ),
              (route) => false,
            );
          } else if (AppStorage.getUserInfo!.result!.shopId != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavigatorScreen(homeType: 4),
              ),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => NavigatorScreen(homeType: 1),
              ),
              (route) => false,
            );
          }
        } else {
          log("the user is not loged in");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false,
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColorLight,
        body: SplashScreenContent());
  }

  void _handleOnSplashLoaded(//SpecializationsEntity specializationsEntity
      ) async {
    var prefs = await SpUtil.getInstance();
    double? longitude = await prefs.getDouble(AppConstants.KEY_LONGITUDE);
    double? latitude = await prefs.getDouble(AppConstants.KEY_LATITUDE);
    if (longitude != null && latitude != null) {
      LatLng latLng = LatLng(latitude, longitude);
    }
    // Provider.of<SessionDataProvider>(context, listen: false)
    //     .specializationsEntity = specializationsEntity;
    if (prefs.getString(AppConstants.KEY_TOKEN) != null) {
    }
    // Nav.off(NavigatorScreen.routeName, cleanHistory: true);
    else
      Nav.off(IntroScreen.routeName);
  }
}
