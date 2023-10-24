import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import 'package:trainee_restaurantapp/core/dioHelper/dio_helper.dart';
import 'package:trainee_restaurantapp/core/models/user_model.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';
import 'package:trainee_restaurantapp/features/Acount/data/models/create_restaurant_model.dart';
import 'package:trainee_restaurantapp/features/Acount/data/models/create_shop_model.dart';
import '../../../on_boarding/view/main_onboarding_view.dart';
import '../models/register_restaurant_model.dart';
import '../models/specialization_model.dart';

class AuthRepo {
  Future<Either<String, String>> uploadImage(File file) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last,
          contentType: MediaType("image", "jpeg"))
    });
    final response = await DioHelper.post(
      APIUrls.API_Upload_Image,
      formData: formData,
    );
    try {
      if (response.data['success'] == true) {
        print("Success uploadImage");
        return Right(response.data['result']['url']);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SpecializationModel>> getSpecialization() async {
    final response = await DioHelper.get(
      APIUrls.API_GetAll_Index,
    );
    try {
      print(response.toString());

      if (response.data['success'] == true) {
        return Right(SpecializationModel.fromJson(response.data));
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> assignSubscriptionToUser(int typeUser) async {
    final response = await DioHelper.post(
      APIUrls.API_AssignSubscriptionToUser,
      body: typeUser == 1
          ? {
              "trainerId": AppStorage.getUserData.result!.userId,
              "subscriptionId": 1000 //subscriptionId
            }
          : typeUser == 3
              ? {
                  "restaurantId": AppStorage.getUserData.result!.restaurantId,
                  "subscriptionId": 1001 //subscriptionId
                }
              : {
                  "shopId": AppStorage.getUserData.result!.shopId,
                  "subscriptionId": 1002 //subscriptionId
                },
    );
    try {
      if (response.data['success'] == true) {
        print("Success assignSubscriptionToUser");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> logout(context) async {
    final response = await DioHelper.post(
      APIUrls.API_Logout,
    );
    try {
      if (response.statusCode == 200) {
        print("Success logout");
        AppStorage.signOut();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MainOnBoardingView()));
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> changePassword(
      String currentPassword, String newPassword) async {
    final response = await DioHelper.post(APIUrls.API_ChangePassword, body: {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });
    try {
      if (response.data['success'] == true) {
        print("Success changePassword");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> resendCode(String phone, int userType) async {
    final response = await DioHelper.post(
      APIUrls.API_VERIFY_RESEND_CODE,
      body: {
        "phoneNumber": phone,
        "userType": userType,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success resendCode");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> verifyAccount(String phone, String code) async {
    final response = await DioHelper.post(
      APIUrls.API_VERIFY_ACCOUNT,
      body: {
        "usernameOrEmailOrPhone": phone,
        "code": code,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success verifyAccount");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> registerShop(
      RegisterRestaurantModel registerRestaurantModel) async {
    final response = await DioHelper.post(
      APIUrls.API_REGISTER_SHOP,
      body: await registerRestaurantModel.toJson(),
    );
    try {
      print(response);
      if (response.data['success'] == true) {
        print("Success registerShop");
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> registerRestaurant(
      RegisterRestaurantModel registerRestaurantModel) async {
    await registerRestaurantModel
        .toJson()
        .then((value) => value.forEach((key, value) {
              print("$key $value");
            }));
    final response = await DioHelper.post(
      APIUrls.API_REGISTER_REST,
      body: await registerRestaurantModel.toJson(),
    );
    try {
      if (response.data['success'] == true) {
        print("Success registerRestaurant");
        // await AppStorage.cacheUserInfo(UserModel.fromJson(response.data));
        return Right(UserModel.fromJson(response.data));
      } else {
        print(response);
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> createShop(
      CreateShopModel createShopModel) async {
    print(createShopModel.toJson());
    print("Sssssssssssssssssssss");
    final response = await DioHelper.post(
      APIUrls.API_CREATE_SHOP,
      body: createShopModel.toJson(),
    );
    try {
      if (response.data['success'] == true) {
        print("Success createShop");
        return Right(UserModel.fromJson(response.data));
      } else {
        print(response.data);
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> createRestaurant(
      CreateRestaurantModel createRestaurantModel) async {
    final response = await DioHelper.post(
      APIUrls.API_CREATE_REST,
      body: await createRestaurantModel.toJson(),
    );
    try {
      print(response.data);

      if (response.data['success'] == true) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> registerTrainer(
      {required String phoneNumber,
      required String name,
      required String password,
      required String countryCode,
      required int specializationId}) async {
    final response = await DioHelper.post(
      APIUrls.API_REGISTER_TRAINER,
      body: {
        "name": name,
        "specializationId": specializationId,
        "password": password,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
      },
    );
    log(response.toString());
    try {
      if (response.data['success'] == true) {
        print("Success registerTrainer");
        // await AppStorage.cacheUserInfo(UserModel.fromJson(response.data));
        return Right(UserModel.fromJson(response.data));
      } else {
        log("message");
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> forgetPasswordVerify(
      String phone, String code, String newPassword) async {
    final response = await DioHelper.post(
      APIUrls.API_VERIFY_FORGETPASSWORD,
      body: {
        "usernameOrEmailOrPhone": phone,
        "code": code,
        "newPassword": newPassword,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success forgetPasswordVerify");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> forgetPassword(String phone) async {
    final response = await DioHelper.post(
      APIUrls.API_FORGETPASSWORD,
      body: {
        "usernameOrEmailOrPhone": phone,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success forgetPassword");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<Map<String,dynamic>, UserModel>> login(
      String phone, String password, int type) async {
   
    final response = await DioHelper.post(
      APIUrls.API_LOGIN,
      body: {
        "userNameOrEmailAddress": phone,
        "password": password,
        "rememberClient": true,
        "type": type,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success login");
        await AppStorage.cacheUserInfo(UserModel.fromJson(response.data));
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(response.data['error']);
      }
    } catch (e) {
      return Left({"error":e.toString()});
    }
  }
}
