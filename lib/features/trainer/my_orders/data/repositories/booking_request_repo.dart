<<<<<<< HEAD
import 'package:dartz/dartz.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';
import '../../../../../core/dioHelper/dio_helper.dart';
import '../models/booking_request_model.dart';

class BookingRequestRepo {
  Future<Either<String, List<BookingRequestModel>>> getBookingRequests(
      int status) async {
    final response = await DioHelper.get(APIUrls.API_GET_BOOKING_REQUESTS,
        query: {"Status": status});
    try {
      if (response.data['success'] == true) {
        List<BookingRequestModel> bookingRequests = [];
        for (int i = 0; i < response.data['result']["items"].length; i++) {
          bookingRequests.add(BookingRequestModel.fromJson(
              response.data['result']["items"][i]));
        }
        return Right(bookingRequests);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> approveBookingRequest(
      int bookingRequestId) async {
    final response = await DioHelper.put(
      APIUrls.API_APPROVE_BOOKING_REQUEST,
      body: {"id": bookingRequestId},
    );
    print(">>>>>>>><<<<<<<${response.data}");
    try {
      if (response.data['success'] == true) {
        print("Success approve");
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> rejectBookingRequest(
      int bookingRequestId) async {
    final response = await DioHelper.put(
      APIUrls.API_REJECT_BOOKING_REQUEST,
      body: {"id": bookingRequestId},
    );
    print(">>>>>>>><<<<<<<${response.data}");
    try {
      if (response.data['success'] == true) {
        print("Success approve");
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
=======
import 'package:dartz/dartz.dart';
import 'package:trainee_restaurantapp/core/net/api_url.dart';
import '../../../../../core/dioHelper/dio_helper.dart';
import '../models/booking_request_model.dart';

class BookingRequestRepo {
  Future<Either<String, List<BookingRequestModel>>> getBookingRequests(
      int status) async {
    final response = await DioHelper.get(APIUrls.API_GET_BOOKING_REQUESTS,
        query: {"Status": status});
    try {
      if (response.data['success'] == true) {
        List<BookingRequestModel> bookingRequests = [];
        for (int i = 0; i < response.data['result']["items"].length; i++) {
          bookingRequests.add(BookingRequestModel.fromJson(
              response.data['result']["items"][i]));
        }
        return Right(bookingRequests);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> approveBookingRequest(
      int bookingRequestId) async {
    final response = await DioHelper.put(
      APIUrls.API_APPROVE_BOOKING_REQUEST,
      body: {"id": bookingRequestId},
    );
    print(">>>>>>>><<<<<<<${response.data}");
    try {
      if (response.data['success'] == true) {
        print("Success approve");
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> rejectBookingRequest(
      int bookingRequestId) async {
    final response = await DioHelper.put(
      APIUrls.API_REJECT_BOOKING_REQUEST,
      body: {"id": bookingRequestId},
    );
    print(">>>>>>>><<<<<<<${response.data}");
    try {
      if (response.data['success'] == true) {
        print("Success approve");
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
