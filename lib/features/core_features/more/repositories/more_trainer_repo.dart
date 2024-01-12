import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';
import '../../../../core/dioHelper/dio_helper.dart';

class MoreTrainerRepo {
  Future<Either<String, bool>> addFeedback(String subject, String desc) async {
    final response = await DioHelper.post(
      APIUrls.API_CREATE_REPORT,
      body: {"description": desc, "subject": subject},
    );
    log(response.toString());
    try {
      if (response.data['success'] == true) {
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getPrivacyPolicy() async {
    final response = await DioHelper.get(APIUrls.API_PRIVACY_PLICY);

    try {
      if (response.data['success'] == true) {
        return Right(response.data['result']);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getAboutApp() async {
    final response = await DioHelper.get(APIUrls.API_ABOUT_APP);

    try {
      if (response.data['success'] == true) {
        return Right(response.data['result']);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
