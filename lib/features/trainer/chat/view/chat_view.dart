import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/chat_search.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/recent_chats_list_view.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/widgets/trainees_list_view.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        title: LanguageHelper.getTranslation(context).chat_with_your_trainers,
      ),
      body: Column(
        children: [
          const ChatTraieesListView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.white,
            ),
          ),
          SearchContainer(),
          const RecentChatsListView()
        ],
      ),
    );
  }
}
