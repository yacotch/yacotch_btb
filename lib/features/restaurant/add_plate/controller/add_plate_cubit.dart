import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/navigation/helper.dart';

import '../../../../core/ui/toast.dart';
import '../../../navigator_home/view/navigator_home_view.dart';
import '../../../../core/models/categories_model.dart';
import '../data/repositories/add_plate_repo.dart';
import '../view/success_plate_add.dart';

part 'add_plate_state.dart';

class AddPlateCubit extends Cubit<AddPlateState> {
  AddPlateCubit() : super(AddPlateInitial());

  static AddPlateCubit of(context) => BlocProvider.of(context);

  final AddPlateRepo addPlateRepo = AddPlateRepo();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode nameArPlate = FocusNode();
  FocusNode nameEnPlate = FocusNode();
  FocusNode comPlate = FocusNode();
  FocusNode pricePlate = FocusNode();
  FocusNode comArPlate = FocusNode();
  FocusNode comEnPlate = FocusNode();

  TextEditingController nameArPlateController = TextEditingController();
  TextEditingController nameEnPlateController = TextEditingController();
  TextEditingController pricePlateController = TextEditingController();
  TextEditingController componentsEnPlateController = TextEditingController();
  TextEditingController componentsArPlateController = TextEditingController();

  List<Items> listOfCates = [];

  Items? dropdownValueCate;
  File? file;
  String? img;

  Future uploadImage(BuildContext context, File file) async {
    emit(UploadImageLoading());
    final res = await addPlateRepo.uploadImage(file);
    res.fold(
      (err) {
        Toast.show(err);
        emit(AddPlateInitial());
      },
      (res) async {
        img = res;
        //  emit(UploadImageLoaded());
      },
    );
  }

  Future getCategories() async {
    emit(GetCategoryLoading());
    final res = await addPlateRepo.getCategories();
    res.fold(
      (err) {
        Toast.show(err);
      },
      (res) {
        listOfCates.addAll(res.result!.items ?? []);
        emit(GetCategoryLoaded());
      },
    );
  }

  Future createDish(BuildContext context) async {
    print("ssssssssssss");

    if (formKey.currentState!.validate() && file != null) {
      await uploadImage(context, file!);
      final res = await addPlateRepo.createDish(
        arName: nameArPlateController.text,
        enName: nameEnPlateController.text,
        price: int.parse(pricePlateController.text),
        categoryId: dropdownValueCate == null ? 0 : dropdownValueCate!.id ?? 0,
        enComponents: componentsEnPlateController.text,
        arComponents: componentsArPlateController.text,
        image: img!,
      );
      res.fold(
        (err) {
          Toast.show(err);
          emit(AddPlateError());
        },
        (res) {
          NavigationHelper.gotoReplacement(
              screen: const SuccessPlateAdd(), context: context);
          emit(AddPlateLoaded());
        },
      );
    } else {
      Toast.show(LanguageHelper.getTranslation(context).complete_data);
    }
  }

  getPlateImage() async {
    ImagePicker picker = ImagePicker();
    var result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      file = File(result.path);
      emit(plateImageSelected());
    }
  }
}
