<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_button.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/name.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/price.dart';

class SubscriptionItem extends StatefulWidget {
  final SubscriptionModel subscriptionModel;
  final Color backGroundColor;
  final int typeUser;
  const SubscriptionItem({
    Key? key,
    required this.backGroundColor,
    required this.subscriptionModel,
    required this.typeUser,
  }) : super(key: key);

  @override
  _SubscriptionItemState createState() => _SubscriptionItemState();
}

class _SubscriptionItemState extends State<SubscriptionItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
   return Card(
        color: Color(int.parse(
            "0xff${widget.subscriptionModel.colorCode!.replaceAll("#", '')}")),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SubscriptionNameWidget(
                    subscriptionModel: widget.subscriptionModel),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SubscriptionPriceWidget(
                    subscriptionModel: widget.subscriptionModel),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("كل سنة",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
              if (isExpanded)
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      color: AppColors.darkGrey50,
                      constraints:
                          BoxConstraints(maxHeight: 150.h, minHeight: 100.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListView.builder(
                        itemCount:
                            widget.subscriptionModel.usedSubscriptions?.length,
                        itemBuilder: (context, index) =>
                            SubscriptionDescriptionWidget(
                                text: widget.subscriptionModel
                                    .usedSubscriptions![index].name!),
                      ),
                    ),
                    CustomElevatedButton(
                        onTap: () {},
                        text: LanguageHelper.getTranslation(context).subscribe)
                  ],
                ),
              Divider(
                thickness: 2.5.h,
                color: const Color(0xff0E1017),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: const Color(0xff0E1017),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SubscriptionDescriptionWidget extends StatelessWidget {
  final String text;
  const SubscriptionDescriptionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(children: [
        Container(
          width: 30.w, height: 30.w, // Adjust the size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.greenColorButton,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.done,
            color: AppColors.greenColorButton,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .45),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.lightGreyFontColor,
            ),
          ),
        ),
      ]),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_button.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/data/models/subscription_model.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/name.dart';
import 'package:trainee_restaurantapp/features/trainer/subscription/presentation/widgets/price.dart';

class SubscriptionItem extends StatefulWidget {
  final SubscriptionModel subscriptionModel;
  final Color backGroundColor;
  final int typeUser;
  const SubscriptionItem({
    Key? key,
    required this.backGroundColor,
    required this.subscriptionModel,
    required this.typeUser,
  }) : super(key: key);

  @override
  _SubscriptionItemState createState() => _SubscriptionItemState();
}

class _SubscriptionItemState extends State<SubscriptionItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
   return Card(
        color: Color(int.parse(
            "0xff${widget.subscriptionModel.colorCode!.replaceAll("#", '')}")),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SubscriptionNameWidget(
                    subscriptionModel: widget.subscriptionModel),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SubscriptionPriceWidget(
                    subscriptionModel: widget.subscriptionModel),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("كل سنة",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
              if (isExpanded)
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      color: AppColors.darkGrey50,
                      constraints:
                          BoxConstraints(maxHeight: 150.h, minHeight: 100.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListView.builder(
                        itemCount:
                            widget.subscriptionModel.usedSubscriptions?.length,
                        itemBuilder: (context, index) =>
                            SubscriptionDescriptionWidget(
                                text: widget.subscriptionModel
                                    .usedSubscriptions![index].name!),
                      ),
                    ),
                    CustomElevatedButton(
                        onTap: () {},
                        text: LanguageHelper.getTranslation(context).subscribe)
                  ],
                ),
              Divider(
                thickness: 2.5.h,
                color: const Color(0xff0E1017),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: const Color(0xff0E1017),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SubscriptionDescriptionWidget extends StatelessWidget {
  final String text;
  const SubscriptionDescriptionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(children: [
        Container(
          width: 30.w, height: 30.w, // Adjust the size as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.greenColorButton,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.done,
            color: AppColors.greenColorButton,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .45),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.lightGreyFontColor,
            ),
          ),
        ),
      ]),
    );
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
