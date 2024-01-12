import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/core_features/profile/social_media/links_model.dart';
import 'package:trainee_restaurantapp/features/core_features/profile/social_media/social_media.dart';
import 'package:trainee_restaurantapp/features/shop/shop_profile/shop_profile_controller/shop_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/shop/shop_profile/view/edit_shop_profile.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/route_generator.dart';
import '../../../../core/ui/loader.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/models/shop_model.dart';
import '../../../trainer/notification/presentation/view/notification_screen.dart';
import '../../../trainer/trainee/presentation/view/trainee_profile_view.dart';

class ShopProfile extends StatefulWidget {
  const ShopProfile({super.key});

  @override
  State<ShopProfile> createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile> {
  Widget _buildSubscriptionWidget(ShopModel restaurantsModel) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 147.h,
            decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius10)),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: restaurantsModel.logo == null
                              ? const DecorationImage(
                                  image: AssetImage(AppConstants.AVATER_IMG),
                                  fit: BoxFit.fill)
                              : DecorationImage(
                                  image:
                                      NetworkImage(restaurantsModel.logo ?? ''),
                                  fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: restaurantsModel.name ?? "",
                            fontSize: AppConstants.textSize16,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          // Row(
                          //   children: [
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         const Icon(
                          //           FontAwesomeIcons.phone,
                          //           color: AppColors.accentColorLight,
                          //           size: 14,
                          //         ),
                          //         Gaps.hGap4,
                          //         CustomText(
                          //           maxLines: 2,
                          //           text: restaurantsModel.phoneNumber ?? "",
                          //           color: AppColors.white,
                          //           fontSize: AppConstants.textSize14,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ],
                          //     ),
                          //     Gaps.hGap8,
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         const Icon(
                          //           FontAwesomeIcons.locationDot,
                          //           color: AppColors.accentColorLight,
                          //           size: 14,
                          //         ),
                          //         Gaps.hGap4,
                          //         CustomText(
                          //           maxLines: 2,
                          //           text:
                          //           "${restaurantsModel.city?.text} - ${restaurantsModel.street}",
                          //           color: AppColors.white,
                          //           fontSize: AppConstants.textSize14,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomText(
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    textOverflow: TextOverflow.ellipsis,
                    text: restaurantsModel.description ?? "",
                    color: AppColors.white,
                    fontSize: AppConstants.textSize12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget traineeCard({required context}) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.traineeProfileScreen);
      },
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.linearCardTrainee1Color.withOpacity(1),
                    AppColors.linearCardTrainee2Color.withOpacity(1),
                    AppColors.linearCardTrainee3Color.withOpacity(1),
                    AppColors.linearCardTrainee4Color.withOpacity(1),
                  ]),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: "رامي المصري",
                    fontSize: AppConstants.textSize18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "العدد: ",
                        color: AppColors.white,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: " 4",
                        color: AppColors.accentColorLight,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "2000 ريال",
                          fontSize: AppConstants.textSize14,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                          color: AppColors.accentColorLight,
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          text: DateTime.now().toString().substring(0, 10),
                          fontSize: AppConstants.textSize14,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                          color: AppColors.backgroundColorLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Gaps.hGap4,
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppConstants.COACH1_IMAGE),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _restaurantProfileData(ShopModel shopModel) {
    var tr = LanguageHelper.getTranslation(context);

    final List<String> restaurantProfileMochitDataList = [
      shopModel.phoneNumber ?? tr.no_data_found,

    ];
    final List<String> restaurantProfileConstantList = [
      tr.phone,
     tr.shopManagerName,
     
    ];

    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                height: .06.sh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: restaurantProfileConstantList[index],
                      color: AppColors.accentColorLight,
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstants.textSize14,
                    ),
                    CustomText(
                      text: restaurantProfileMochitDataList[index],
                      color: AppColors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstants.textSize12,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                color: AppColors.grey,
              );
            },
            itemCount: 2 //4
            ),
      ),
    );
  }

  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    ShopProfileCubit.of(context).getShopProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).welcome,
        actions: [
          GestureDetector(
              onTap: () {
                NavigationHelper.goto(
                    screen: EditShopScreenContent(), context: context);
              },
              child:
                  const ImageIcon(AssetImage(AppConstants.EDIT_PROFILE_ICON))),
          Gaps.hGap16,
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
            },
            child: const Icon(
              Icons.notifications,
              color: AppColors.white,
            ),
          ),
          Gaps.hGap20,
        ],
      ),
      body: BlocBuilder<ShopProfileCubit, ShopProfileState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is GetShopProfileLoading) {
            return const Loader();
          } else {
            var restaurantsModel = ShopProfileCubit.of(context).shopModel;
            return SafeArea(
              child: CustomScrollView(slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomSliverDelegate(
                    image: restaurantsModel!.cover ?? '',
                    expandedHeight: 220.h,
                    child: _buildSubscriptionWidget(restaurantsModel),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Gaps.vGap10,
                        _restaurantProfileData(restaurantsModel),
                        // _restaurantProfileWorkingHours(restaurantsModel),

                        SocialMediaLinksWiget(
                            links: SocialMediaLinks(
                          facebook: restaurantsModel.facebookUrl,
                          instagramUrl: restaurantsModel.instagramUrl,
                          twitterUrl: restaurantsModel.twitterUrl,
                          websiteUrl: restaurantsModel.websiteUrl,
                        )),
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

class SocialModel {
  final IconData iconData;
  final String text;

  SocialModel(this.iconData, this.text);
}
