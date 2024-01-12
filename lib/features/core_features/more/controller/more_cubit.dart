import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/features/core_features/more/repositories/more_trainer_repo.dart';
import '../../../../../core/ui/toast.dart';
part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreTrainerInitial());

  static MoreCubit of(context) => BlocProvider.of(context);

  final moreTrainerRepo = MoreTrainerRepo();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode subjectFocusNode = FocusNode();
  FocusNode descFocusNode = FocusNode();

  final subjectController = TextEditingController();
  final descController = TextEditingController();

  Future addFeedback(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      unFocus(context);
      emit(CreateReportLoading());
      final res = await moreTrainerRepo.addFeedback(
          subjectController.text, descController.text);
      res.fold(
        (err) {
          Toast.show(err);
          emit(CreateReportError());
        },
        (res) async {
          Navigator.pop(context);
          emit(CreateReportLoaded());
        },
      );
    }
  }

  unFocus(context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  bool isEnableNotification = true;
  void enableNotifications() async {
    isEnableNotification = !isEnableNotification;
    await AppStorage.cacheNotificationsEnabled(isEnableNotification);
    emit(MoreChangeEnableNotificationsState());
  }

  Future getPrivacyPolicy() async {
    emit(PrivacyPolicyLoading());
    final res = await moreTrainerRepo.getPrivacyPolicy();
    res.fold(
      (err) {
        Toast.show(err);
        emit(PrivacyPolicyError());
      },
      (res) async {
        emit(PrivacyPolicyLoaded(res));
      },
    );
  }

  Future getAboutApp() async {
    emit(AboutAppLoading());
    final res = await moreTrainerRepo.getAboutApp();
    res.fold(
      (err) {
        Toast.show(err);
        emit(AboutAppError());
      },
      (res) async {
        emit(AboutAppLoaded(res));
      },
    );
  }
}
