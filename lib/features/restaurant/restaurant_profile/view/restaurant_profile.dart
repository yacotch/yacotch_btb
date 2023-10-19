import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/restaurant/restaurant_profile/rest_profile_controller/rest_profile_cubit.dart';
import 'package:trainee_restaurantapp/features/restaurant/restaurant_profile/view/edit_restaurant_profile.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/loader.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../generated/l10n.dart';
import '../../../trainer/notification/presentation/view/notification_screen.dart';
import '../../../trainer/trainee/presentation/view/trainee_profile_view.dart';
import '../data/models/restaurants_model.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({super.key});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  Widget _buildSubscriptionWidget(RestaurantsModel restaurantsModel) {
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
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.phone,
                                    color: AppColors.accentColorLight,
                                    size: 14,
                                  ),
                                  Gaps.hGap4,
                                  CustomText(
                                    maxLines: 2,
                                    text: restaurantsModel.phoneNumber ?? "",
                                    color: AppColors.white,
                                    fontSize: AppConstants.textSize14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Gaps.hGap8,
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Icon(
                              //       FontAwesomeIcons.locationDot,
                              //       color: AppColors.accentColorLight,
                              //       size: 14,
                              //     ),
                              //     Gaps.hGap4,
                              //     CustomText(
                              //       maxLines: 2,
                              //       text:
                              //       "${restaurantsModel.city?.text} - ${restaurantsModel.street}",
                              //       color: AppColors.white,
                              //       fontSize: AppConstants.textSize14,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
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

  Widget _restaurantProfileData(RestaurantsModel restaurantsModel) {
    var tr = LanguageHelper.getTranslation(context);
    final List<String> restaurantProfileMochitDataList = [
      restaurantsModel.phoneNumber ?? '',
      restaurantsModel.commercialRegisterNumber ?? '',
      restaurantsModel.commercialRegisterDocument!,
      restaurantsModel.manager?.name ?? ''
      // restaurantsModel.city?.text ?? '',
      // restaurantsModel.city?.text ?? '',
      // restaurantsModel.street ?? '',
      // "بناء رقم ${restaurantsModel.buildingNumber}"
    ];

    final List<String> restaurantProfileConstantList = [
      tr.phone,
      tr.commericalNumber,
      tr.commericalFile,
      tr.restaurantManagerName,
      //"البلد",
      //"المدينه",
      //"الشارع",
      // "رقم البناء"
    ];

    return SizedBox(
      height: 220.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView.separated(
            // physics: const NeverScrollableScrollPhysics(),
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
                    index == 2
                        ? InkWell(
                            child: CustomText(
                              text: "image.png",
                              color: AppColors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                              fontSize: AppConstants.textSize12,
                            ),
                            onTap: () => NavigationHelper.goto(
                                screen: Scaffold(
                                  appBar: AppBar(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  body: Center(
                                    child: Image.network(
                                      restaurantProfileMochitDataList[index],
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            AppConstants.COACH1_IMAGE);
                                      },
                                    ),
                                  ),
                                ),
                                context: context),
                          )
                        : CustomText(
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
            itemCount: 4),
      ),
    );
  }

  Widget _restaurantProfileWorkingHours(RestaurantsModel restaurantsModel) {
    return SizedBox(
      height: 320.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomText(
              text: "أيام وساعات العمل",
              fontWeight: FontWeight.w600,
              fontSize: AppConstants.textSize18,
              color: AppColors.white,
            ),
          ),
          Expanded(
            child: restaurantsModel.openingDays!.isEmpty
                ? const Center(
                    child: Text('لا توجد ايام حاليا'),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: AppColors.accentColorLight,
                                    ),
                                    Gaps.hGap8,
                                    CustomText(
                                      text: RestProfileCubit.of(context)
                                          .convertDays(restaurantsModel
                                              .openingDays![index].day!),
                                      color: AppColors.accentColorLight,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppConstants.textSize14,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text:
                                        "من ${DateFormat('HH:mm').format(DateTime.parse(restaurantsModel.openingDays![index].from ?? ''))}",
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppConstants.textSize14,
                                  ),
                                  CustomText(
                                    text:
                                        "الي ${DateFormat('HH:mm').format(DateTime.parse(restaurantsModel.openingDays![index].to ?? ''))}",
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppConstants.textSize14,
                                  ),
                                ],
                              )),
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
                      itemCount: restaurantsModel.openingDays!.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _restaurantProfileSocialMedia(RestaurantsModel restaurantsModel) {
    var nodata = LanguageHelper.getTranslation(context).no_data_found;
    List<SocialModel> listOfSocial = [
      SocialModel(
          FontAwesomeIcons.facebook, restaurantsModel.facebookUrl ?? nodata),
      SocialModel(
          FontAwesomeIcons.sitemap, restaurantsModel.websiteUrl ?? nodata),
      SocialModel(
          FontAwesomeIcons.instagram, restaurantsModel.instagramUrl ?? nodata),
      SocialModel(
          FontAwesomeIcons.twitter, restaurantsModel.twitterUrl ?? nodata),
    ];
    return SizedBox(
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomText(
              text: LanguageHelper.getTranslation(context).social_media_links,
              fontWeight: FontWeight.w600,
              fontSize: AppConstants.textSize18,
              color: AppColors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              color: AppColors.accentColorLight,
                              child: Icon(
                                listOfSocial[index].iconData,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 2,
                              color: AppColors.grey,
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: CustomText(
                              textAlign: TextAlign.end,
                              text: listOfSocial[index].text,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: AppConstants.textSize14,
                            ),
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
                  itemCount: 4),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    RestProfileCubit.of(context).getRestaurantProfile(context);
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
                    screen: EditRestaurantScreenContent(), context: context);
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
      body: BlocBuilder<RestProfileCubit, RestProfileState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is GetRestProfileLoading) {
            return const Loader();
          } else {
            var restaurantsModel =
                RestProfileCubit.of(context).restaurantsModel;
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
                        _restaurantProfileSocialMedia(restaurantsModel)
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
