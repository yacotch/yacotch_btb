
import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/features/navigator_home/view/navigator_home_view.dart';
import 'package:trainee_restaurantapp/features/on_boarding/view/main_onboarding_view.dart';
import 'package:trainee_restaurantapp/features/splash/presentation/screen/splash_screen_content.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/common/app_colors.dart';

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
    _navigateToNextScreen();

    super.initState();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (AppStorage.isLogged) {
          if (AppStorage.getUserInfo!.result!.restaurantId != null) {
            _goToHome(3);
          } else if (AppStorage.getUserInfo!.result!.shopId != null) {
            _goToHome(4);
          } else {
            _goToHome(1);
          }
        } else {
          _goToMainOnBoarding();
        }
      },
    );
  }

  void _goToHome(int type) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatorScreen(homeType: type),
        ),
        (route) => false,
      );
  void _goToMainOnBoarding() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainOnBoardingView(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.primaryColorLight,
        body: SplashScreenContent());
  }
}
