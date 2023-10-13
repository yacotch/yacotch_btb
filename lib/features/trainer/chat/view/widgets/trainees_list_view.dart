import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/loader.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/data/model/chat_model.dart';
import 'package:trainee_restaurantapp/features/trainer/chat/view/chat_details_view.dart';
import 'package:trainee_restaurantapp/features/trainer/home_trainer/presentation/home_trainer_controller/home_trainer_cubit.dart';

class ChatTraieesListView extends StatelessWidget {
  const ChatTraieesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTrainerCubit, HomeTrainerState>(
      builder: (context, state) {
        if (state is GetNewTraineesLoading) {
          return const Loader();
        } else {
          return HomeTrainerCubit.of(context).newTrainees!.isEmpty
              ? Text(LanguageHelper.getTranslation(context).no_trainers)
              : SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          HomeTrainerCubit.of(context).newTrainees!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatDetailsView(
                                        chatModel: ChatModel(
                                      traineeId: HomeTrainerCubit.of(context)
                                          .newTrainees![index]
                                          .traineeId,
                                      traineeImage: HomeTrainerCubit.of(context)
                                              .newTrainees![index]
                                              .trainee!
                                              .imageUrl ??
                                          "",
                                      traineeName: HomeTrainerCubit.of(context)
                                          .newTrainees![index]
                                          .trainee!
                                          .name,
                                    )),
                                  ));
                            },
                            child: Container(
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      HomeTrainerCubit.of(context)
                                              .newTrainees![index]
                                              .trainee!
                                              .imageUrl ??
                                          "",
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                      text: HomeTrainerCubit.of(context)
                                              .newTrainees![index]
                                              .trainee!
                                              .name ??
                                          "",
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppConstants.textSize10),
                                  CustomText(
                                    text: HomeTrainerCubit.of(context)
                                            .newTrainees![index]
                                            .course!
                                            .text ??
                                        "",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppConstants.textSize10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
        }
      },
    );
  }
}
