<<<<<<< HEAD

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/ui/toast.dart';
import '../../data/models/notification_model.dart';
import '../../data/repositories/notification_repo.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit of(context) => BlocProvider.of(context);

  final _subscriptionRepo = NotificationRepo();


  List<NotificationModel> notifications = [];


  Future getNotifications(BuildContext context) async {
    emit(GetNotificationsLoading());
    final res = await _subscriptionRepo.getNotifications();
    res.fold(
          (err) {
        print(err);
        Toast.show(err);
        emit(GetNotificationsError());
      },
          (res) {
            notifications = res;
        emit(GetNotificationsLoaded(

        ));
      },
    );
  }

}
=======

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/ui/toast.dart';
import '../../data/models/notification_model.dart';
import '../../data/repositories/notification_repo.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit of(context) => BlocProvider.of(context);

  final _subscriptionRepo = NotificationRepo();


  List<NotificationModel> notifications = [];


  Future getNotifications(BuildContext context) async {
    emit(GetNotificationsLoading());
    final res = await _subscriptionRepo.getNotifications();
    res.fold(
          (err) {
        print(err);
        Toast.show(err);
        emit(GetNotificationsError());
      },
          (res) {
            notifications = res;
        emit(GetNotificationsLoaded(

        ));
      },
    );
  }

}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
