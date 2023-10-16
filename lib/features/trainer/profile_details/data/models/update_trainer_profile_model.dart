import 'dart:io';

import 'package:dio/dio.dart';

class UpdateTrainerProfileModel {
  int? id;
  String? imageUrl;
  String? name;
  String? cvUrl;
  List<String>? experinecUrl;
  String? phoneNumber;
  double? latitude;
  double? longitude;
  String? idNumber;
  double? hourPrice;
  int? specializationId;

  UpdateTrainerProfileModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.cvUrl,
    required this.experinecUrl,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.idNumber,
    required this.hourPrice,
    required this.specializationId,
  });

  Map<String, dynamic> toJson() {
    print("sssssssssssssssssss ${experinecUrl}");
    return {
      "specializationId": specializationId,
      "imageUrl": imageUrl,
      "name": name,
      "cvUrl": cvUrl,
      "experienceFiles": experinecUrl ?? [],
      "phoneNumber": phoneNumber,
      "countryCode": 966,
      "latitude": latitude,
      "longitude": longitude,
      "idNumber": idNumber,
      "hourPrice": hourPrice,
      "id": id,
    };
  }
}
