import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/flutter_localization.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/data/models/booking_request_model.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/controller/booking_request_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/filter_item.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/image_course_name.dart';
import 'package:trainee_restaurantapp/generated/l10n.dart';

const String defaultAvatar =
    "https://minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg";

class CardDetails extends StatelessWidget {
  final bool selectedCard;
  final BookingRequestModel bookingRequestModel;
  final Function() ontap;
  const CardDetails(this.ontap,
      {super.key,
      required this.selectedCard,
      required this.bookingRequestModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(colors: FitlerGradientColors),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: MediaQuery.sizeOf(context).width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    minLeadingWidth: 18.w,
                    contentPadding: EdgeInsets.zero,
                    //trainee image
                    leading: CircleAvatar(
                        radius: 18.w,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          bookingRequestModel.trainee!.imageUrl ??
                              defaultAvatar,
                        )),
                    horizontalTitleGap: 10.w,
                    //trainee name
                    title: CustomText(
                      text: bookingRequestModel.trainee!.name != null &&
                              bookingRequestModel.trainee!.name!.isNotEmpty
                          ? bookingRequestModel.trainee!.name!
                          : LanguageHelper.getTranslation(context)
                              .no_data_found,
                      fontSize: AppConstants.textSize14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      textAlign: TextAlign.start,
                    ),
                    //request id
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: CustomText(
                        text: "# ${bookingRequestModel.id!}",
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  //paid amount
                  CustomText(
                    text:
                        "${bookingRequestModel.paidAmount ?? 0} ${Translation.of(context).saudi_riyal}",
                    color: AppColors.accentColorLight,
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstants.textSize14,
                  ),
                  //dreation date
                  CustomText(
                    text: DateFormat(
                            'MM/dd/yyyy hh:mm a',
                            Provider.of<LocalizationProvider>(context)
                                .currentLanguage)
                        .format(
                            DateTime.parse(bookingRequestModel.creationTime!)),
                    color: AppColors.accentColorLight,
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstants.textSize14,
                  ),
                  if (!selectedCard)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            BookingRequestCubit.of(context)
                                .approveBookingRequest(
                                    context, bookingRequestModel.id!);
                            ontap();
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.green,
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Gaps.hGap12,
                        InkWell(
                          onTap: () => BookingRequestCubit.of(context)
                              .rejectBookingRequest(
                                  context, bookingRequestModel.id!),
                          child: const CircleAvatar(
                            backgroundColor: AppColors.red,
                            child: Icon(
                              FontAwesomeIcons.xmark,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  SizedBox(height: 5.h)
                ],
              )),
          ImageWithCourseName(bookingRequestModel: bookingRequestModel)
        ],
      ),
    );
  }
}
