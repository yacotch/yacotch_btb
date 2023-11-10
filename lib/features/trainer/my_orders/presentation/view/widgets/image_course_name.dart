import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/blur_widget.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/data/models/booking_request_model.dart';

const String defaultCourseImage =
    'https://th.bing.com/th/id/OIP.EwbatycHx_915hcNzd7vRgHaE8?pid=ImgDet&rs=1';

class ImageWithCourseName extends StatelessWidget {
  final BookingRequestModel bookingRequestModel;

  const ImageWithCourseName({Key? key, required this.bookingRequestModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .2.sh,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          //image
          Container(
            height: .2.sh,
            width: MediaQuery.sizeOf(context).width * .35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
              color: Colors.black.withOpacity(.4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius10),
              child: Image.network(
                  bookingRequestModel.course!.imageUrl ?? defaultCourseImage,
                  fit: BoxFit.fill),
            ),
          ),
          //course name
          BlurWidget(
            blurDegree: 10,
            child: Container(
              width: MediaQuery.sizeOf(context).width * .35,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: CustomText(
                text: bookingRequestModel.course?.text ??
                    LanguageHelper.getTranslation(context).no_data_found,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                textAlign: TextAlign.center,
                fontSize: AppConstants.textSize12,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
