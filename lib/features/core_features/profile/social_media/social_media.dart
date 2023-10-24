import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/helpers/url_launcher.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/core_features/profile/social_media/links_model.dart';
import 'package:trainee_restaurantapp/features/restaurant/restaurant_profile/view/restaurant_profile.dart';

class SocialMediaLinksWiget extends StatelessWidget {
  final SocialMediaLinks links;
  const SocialMediaLinksWiget({required this.links, super.key});

  @override
  Widget build(BuildContext context) {
    var nodata = LanguageHelper.getTranslation(context).no_data_found;
    List<SocialModel> listOfSocial = [
      SocialModel(FontAwesomeIcons.facebook, links.facebook ?? nodata),
      SocialModel(FontAwesomeIcons.sitemap, links.websiteUrl ?? nodata),
      SocialModel(FontAwesomeIcons.instagram, links.instagramUrl ?? nodata),
      SocialModel(FontAwesomeIcons.twitter, links.twitterUrl ?? nodata),
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: SizedBox(
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
                              child: Icon(
                                listOfSocial[index].iconData,
                                color: AppColors.accentColorLight,
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
                              child: InkWell(
                                onTap: () => UrlLauncherHelper.open(
                                    listOfSocial[index].text, context),
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: listOfSocial[index].text,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppConstants.textSize14,
                                  maxLines: 2,
                                ),
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
      ),
    );
  }
}
