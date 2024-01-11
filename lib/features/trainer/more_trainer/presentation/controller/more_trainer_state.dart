part of 'more_trainer_cubit.dart';

@immutable
abstract class MoreTrainerState {}

class MoreTrainerInitial extends MoreTrainerState {}

class CreateReportLoading extends MoreTrainerState {}

class CreateReportLoaded extends MoreTrainerState {}

class CreateReportError extends MoreTrainerState {}

class ChangePassLoading extends MoreTrainerState {}

class ChangePassLoaded extends MoreTrainerState {}

class ChangePassError extends MoreTrainerState {}

class MoreChangeEnableNotificationsState extends MoreTrainerState {}

//privacy policy
class PrivacyPolicyLoading extends MoreTrainerState {}

class PrivacyPolicyLoaded extends MoreTrainerState {
  final String data;
  PrivacyPolicyLoaded(this.data);
}

class PrivacyPolicyError extends MoreTrainerState {}

//about app
class AboutAppLoading extends MoreTrainerState {}

class AboutAppLoaded extends MoreTrainerState {
  final String data;
  AboutAppLoaded(this.data);
}

class AboutAppError extends MoreTrainerState {}
