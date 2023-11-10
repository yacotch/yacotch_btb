import 'package:dartz/dartz.dart';
import 'package:trainee_restaurantapp/core/appStorage/app_storage.dart';
import '../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../core/net/api_url.dart';
import '../models/product_model.dart';

class HomeShopRepo {
  Future<Either<String, ProductModel>> getAllProductMostOrderedHome() async {
    final response = await DioHelper.get(
        "${APIUrls.API_GetAll_Product_MostOrdered}&ShopId=${AppStorage.getUserInfo!.result!.shopId}");
    try {
      if (response.data['success'] == true) {
        return Right(ProductModel.fromJson(response.data));
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }
}
