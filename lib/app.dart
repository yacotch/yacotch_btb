import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trainee_restaurantapp/core/datasources/shared_preference.dart';
import 'package:trainee_restaurantapp/core/notifications/calls/payload_extractor.dart';
import 'package:trainee_restaurantapp/core/ui/toast.dart';
// ignore: unused_import
import 'package:trainee_restaurantapp/features/Acount/presentation/screens/completeing_information/shop.dart';
import 'package:trainee_restaurantapp/features/restaurant/my_orders_restaurant/controller/my_orders_restaurant_cubit.dart';
import 'package:trainee_restaurantapp/features/restaurant/restaurant_profile/rest_profile_controller/rest_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/shop/my_orders_shop/controller/my_orders_shop_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/video_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/agora/voice_call_screen.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_courses/presentation/courses_controller/courses_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/trainer_profile_controller/trainer_profile_cubit.dart';
import 'core/common/app_config.dart';
import 'core/common/provider_list.dart';
import 'core/constants/app/app_constants.dart';
import 'core/localization/flutter_localization.dart';
import 'features/restaurant/home_restaurant/controller/home_restaurant_cubit.dart';
import 'features/restaurant/my_plates/controller/my_plates_cubit.dart';
import 'features/shop/my_products/controller/my_products_cubit.dart';
import 'features/shop/shop_profile/shop_profile_controller/shop_profile_cubit.dart';
import 'features/splash/presentation/screen/splash_screen.dart';
import 'features/trainer/my_orders/presentation/controller/booking_request_cubit.dart';
import 'generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const App({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MultiProvider(
        providers: [
          ...ApplicationProvider().dependItems,
          Provider.value(value: routeObserver),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BookingRequestCubit()),
            BlocProvider(
              create: (context) =>
                  TrainerProfileCubit()..getTrainerProfile(context),
            ),
            BlocProvider(
              create: (context) =>
                  RestProfileCubit()..getRestaurantProfile(context),
            ),
            BlocProvider(
              create: (context) => ShopProfileCubit()..getShopProfile(context),
            ),
            BlocProvider(
              create: (context) =>
                  HomeTrainerCubit()..getMostWantedCourses(context),
            ),
            BlocProvider(
              create: (context) =>
                  TrainerProfileCubit()..getTrainerProfile(context),
            ),
            BlocProvider(
              create: (context) => HomeTrainerCubit()
                ..getMostWantedCourses(context)
                ..getNewTrainees(context),
            ),
            BlocProvider(create: (context) => CoursesCubit()),
            BlocProvider(create: (context) => MyOrdersRestaurantCubit()),
            BlocProvider(create: (context) => HomeRestaurantCubit()),
            BlocProvider(create: (context) => MyPlatesCubit()),
            BlocProvider(create: (context) => MyProductsCubit()),
            BlocProvider(create: (context) => MyOrdersShopCubit()),
          ],
          child: Consumer<LocalizationProvider>(
            builder: (_, provider, __) {
              return ScreenUtilInit(
                designSize: AppConfig.screenUtilDesignSize(),
                builder: (context, Widget? child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: AppConstants.TITLE_APP_NAME,
                    navigatorKey: widget.navigatorKey,
                    navigatorObservers: [routeObserver],

                    /// Setup app localization
                    supportedLocales: Translation.delegate.supportedLocales,
                    locale: provider.appLocal,
                    localizationsDelegates: const [
                      Translation.delegate,
                      AppLocalizations.delegate, // Add this line
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],

                    /// Theming
                    theme: AppConfig().themeData,
                    themeMode: AppConfig().themeMode,

                    /// Init screen
                    home: 
                    SplashScreen(),
                   
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ApplicationProvider().dispose(context);
    super.dispose();
  }
}
