import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainee_restaurantapp/core/models/trainer_model.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/data/models/update_trainer_profile_model.dart';
import '../../../../../core/location/LocationAddressImports.dart';
import '../../../../../core/location/location_cubit/location_cubit.dart';
import '../../../../../core/location/model/location_model.dart';
import '../../../../../core/models/review_model.dart';
import '../../../../../core/ui/toast.dart';
import '../../../../../core/utils/Utils.dart';
import '../../data/repositories/trainer_profile_repo.dart';

part 'trainer_profile_state.dart';

class TrainerProfileCubit extends Cubit<TrainerProfileState> {
  TrainerProfileCubit() : super(TrainerProfileInitial());

  static TrainerProfileCubit of(context) => BlocProvider.of(context);

  final trainerProfileRepo = TrainerProfileRepo();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController hourRateController = TextEditingController();
  TextEditingController coachSpecializationController = TextEditingController();

  final LocationCubit locationCubit = LocationCubit();

  double? latitude;
  double? longitude;

  String? networkCvUrl;
  File? fileCvUrl;
  String? imgCvUrl;

  String? networkImageUrl;
  File? fileImageUrl;
  String? imgImageUrl;

  List<String>? oldExperienceFilesUrls;
  List<File>? pickedExperienceFilsList;
  List<String>? uploadedExperienceFilesUrls;

  TrainerModel? trainerModel;

  Future uploadImage(File file) async {
    final res = await trainerProfileRepo.uploadImage(file);
    res.fold(
      (err) {
        Toast.show(err);
        emit(TrainerProfileInitial());
      },
      (res) async {
        if (file == fileImageUrl) {
          imgImageUrl = res;
        } else if (file == fileCvUrl) {
          imgCvUrl = res;
        } else {
          uploadedExperienceFilesUrls ??= [];
          uploadedExperienceFilesUrls!.add(res);
        }
      },
    );
  }

  Future updateTrainerProfile() async {
    emit(UploadImageLoading());
    List<Future> futureList = [];
    fileCvUrl != null ? futureList.add(uploadImage(fileCvUrl!)) : null;
    fileImageUrl != null ? futureList.add(uploadImage(fileImageUrl!)) : null;
    if (pickedExperienceFilsList != null) {
      futureList.addAll(
          pickedExperienceFilsList!.map((e) => uploadImage(e)).toList());
    }
    await Future.wait(futureList);
    UpdateTrainerProfileModel updateTrainerProfileModel =
        UpdateTrainerProfileModel(
      id: trainerModel!.id,
      specializationId: trainerModel!.specializationId,
      phoneNumber: phoneController.text == trainerModel!.phoneNumber
          ? trainerModel!.phoneNumber
          : phoneController.text,
      hourPrice: double.parse(hourRateController.text),
      idNumber: '1',
      name: nameController.text == trainerModel!.name
          ? trainerModel!.name
          : nameController.text,
      experinecUrl:
          uploadedExperienceFilesUrls ?? trainerModel!.experienceFiles,
      cvUrl: imgCvUrl ?? trainerModel!.cvUrl,
      imageUrl: imgImageUrl ?? trainerModel!.imageUrl,
      latitude: locationCubit.state.model!.lat,
      longitude: locationCubit.state.model!.lng,
    );
    updateTrainerProfileModel.toJson().map((key, value) {
      print("$key $value");
      return MapEntry(key, value);
    });
    final res = await trainerProfileRepo
        .updateTrainerProfile(updateTrainerProfileModel);
    res.fold(
      (err) {
        Toast.show(err);
        emit(UpdateTranierProfileError());
      },
      (res) async {
        log(res.toString());
        emit(UpdateTranierProfileLoaded());
      },
    );
  }

  Future getTrainerProfile(BuildContext context) async {
    emit(GetTrainerProfileLoading());
    final res = await trainerProfileRepo.getTrainerProfile();
    res.fold(
      (err) {
        Toast.show(err);
        emit(GetTrainerProfileError());
      },
      (res) {
        trainerModel = res;
        emit(GetTrainerProfileLoaded());
      },
    );
  }

  Future getTrainerReviews(BuildContext context) async {
    emit(GetTrainerReviewsLoading());
    final res = await trainerProfileRepo.getTrainerReviews();
    res.fold(
      (err) {
        Toast.show(err);
        emit(GetTrainerReviewsError());
      },
      (res) {
        print(res);
        emit(GetTrainerReviewsLoaded(res));
      },
    );
  }

  getImage() async {
    ImagePicker picker = ImagePicker();
    var result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      fileImageUrl = File(result.path);
    }
  }

  getCv() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileCvUrl = File(result.files.single.path!);
      emit(EditProfileNewCVPicked());
    }
  }

  getExperience() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, allowedExtensions: ['pdf'], type: FileType.custom);
    if (result != null) {
      pickedExperienceFilsList ??= [];
      pickedExperienceFilsList!
          .addAll(result.files.map((e) => File(e.path!)).toList());
      print(pickedExperienceFilsList);
      emit(EditProfileNewExpFilePicked());
    }
  }

  onLocationClick(context) async {
    var _loc = await Utils.getCurrentLocation(context);
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 32.4,
      lng: _loc?.longitude ?? 32.4,
      address: "",
    ));
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) {
          return FadeTransition(
              opacity: animation,
              child: BlocProvider.value(
                value: locationCubit,
                child: LocationAddress(),
              ));
        },
      ),
    );
  }
}
