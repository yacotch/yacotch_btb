import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/data/model/chat_model.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/data/model/message_model.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/chat_details_view.dart';
import 'package:trainee_restaurantapp/features/trainer/my_orders/presentation/view/widgets/order_details.dart';

class RecentChatsListView extends StatelessWidget {
  const RecentChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder: (context, snapshot) {
        print(snapshot.hasData);
        if (snapshot.connectionState == ConnectionState.none) {
          return const Text(
            'Something went wrong',
            style: TextStyle(color: Colors.white),
          );
        }
        //fetching the data
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        //recent chats
        else {
          List<ChatModel> chats = [];
          for (var element in snapshot.data!.docs) {
            if (element.data()["trainerId"] == AppStorage.getUserId) {
              chats.add(ChatModel.fromJson(element.data()));
            }
          }
          return chats.isEmpty
              ? Center(
                  child: Text(
                      LanguageHelper.getTranslation(context).no_data_found),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatSummaryWidget(chats[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: AppColors.white,
                    );
                  },
                  itemCount: chats.length);
        }
      },
    );
  }
}

class ChatSummaryWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatSummaryWidget(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailsView(chatModel: chat),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 90.h,
          child: Row(
            children: [
              Container(
                width: 80.w,
                height: 95.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      chat.traineeImage == null || chat.traineeImage!.isEmpty
                          ? defaultAvatar
                          : chat.traineeImage!,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: chat.traineeName ?? "",
                    fontSize: AppConstants.textSize18,
                    fontWeight: FontWeight.w600,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chats')
                        .doc(chat.traineeId.toString() +
                            AppStorage.getUserId.toString())
                        .collection("messages")
                        .orderBy("messageTime", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        MessageModel message = MessageModel.fromJson(
                            snapshot.data!.docs.last.data());
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (message.type == "message")
                              Expanded(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: message.message ?? "",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: AppConstants.textSize14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            if (message.type == "file")
                              Expanded(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: "image",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: AppConstants.textSize14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            CustomText(
                              text: message.messageTime!.substring(0, 10),
                              fontSize: AppConstants.textSize14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey,
                            ),
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const SizedBox();
                      }
                      return const SizedBox();
                    },
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
