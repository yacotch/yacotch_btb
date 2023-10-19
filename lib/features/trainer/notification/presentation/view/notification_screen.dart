import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/chat_view.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';

import '../../../../../core/ui/loader.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../data/models/notification_model.dart';
import '../controller/notification_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransparentAppBar(
          title: LanguageHelper.getTranslation(context).notifications,
        ),
        body: BlocProvider(
          create: (context) => NotificationCubit()..getNotifications(context),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is GetNotificationsLoading) {
                return const Loader();
              } else {
                if (NotificationCubit.of(context).notifications.isNotEmpty) {
                  return ListView.separated(
                      itemCount:
                          NotificationCubit.of(context).notifications.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          indent: 25.w,
                          endIndent: 20.w,
                          color: AppColors.darkGrey50,
                          thickness: 2,
                          height: 30.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        return NotificationItem(
                            notificationModel: NotificationCubit.of(context)
                                .notifications[index]);
                      });
                } else {
                  return Center(
                      child: Text(LanguageHelper.getTranslation(context)
                          .no_data_found));
                }
              }
            },
          ),
        ));
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItem({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (notificationModel.msgType == 0) {
          NavigationHelper.gotoReplacement(
              screen: const ChatView(), context: context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 22.w,
              backgroundColor: Colors.white,
              backgroundImage: const NetworkImage(defaultAvatar),
            ),
            SizedBox(width: 8.w),
            Expanded(
                child: Text(
              LanguageHelper.isAr(context)
                  ? notificationModel.arMessage ?? ""
                  : notificationModel.enMessage ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            )),
            SizedBox(width: 3.w),
            Text(
              notificationModel.creationTime!.substring(0, 10),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
