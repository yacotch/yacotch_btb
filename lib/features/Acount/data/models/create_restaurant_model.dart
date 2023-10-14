import 'dart:io';

import 'package:dio/dio.dart';

class CreateRestaurantModel {
  final String arName, enName;
  final String arDescription, enDescription;
  final String arLogo, enLogo, arCover, enCover;
  final String commercialRegisterNumber;
  final String commercialRegisterDocument;
  final String managerName;
  final String facebookUrl, instagramUrl, twitterUrl, websiteUrl;
  final double latitude, longitude;
  final String password, email, phone;
  CreateRestaurantModel(
      {required this.arName,
      required this.enName,
      required this.password,
      required this.email,
      required this.phone,
      required this.arDescription,
      required this.enDescription,
      required this.arLogo,
      required this.enLogo,
      required this.arCover,
      required this.enCover,
      required this.commercialRegisterNumber,
      required this.commercialRegisterDocument,
      required this.managerName,
      required this.facebookUrl,
      required this.instagramUrl,
      required this.twitterUrl,
      required this.websiteUrl,
      required this.latitude,
      required this.longitude});

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arName'] = arName;
    data['enName'] = enName;
    data['phoneNumber'] = phone;
    data['arDescription'] = arDescription;
    data['enDescription'] = enDescription;
    data['arLogo'] = arLogo;
    data['enLogo'] = enLogo;
    data['arCover'] = arCover;
    data['enCover'] = enCover;
    data['commercialRegisterNumber'] = commercialRegisterNumber;
    data['commercialRegisterDocument'] = commercialRegisterDocument;
    data['managerName'] = managerName;
    data['facebookUrl'] = facebookUrl;
    data['instagramUrl'] = instagramUrl;
    data['twitterUrl'] = twitterUrl;
    data['websiteUrl'] = websiteUrl;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['ManagerPassword'] = password;
    data['managerEmail'] = email;
    data['managerPhoneNumber'] = phone;
    data.forEach((key, value) => print("$key $value \n"));
    return data;
  }
}
