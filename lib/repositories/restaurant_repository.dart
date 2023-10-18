import 'dart:convert';

import 'package:foodpanda_clone/data/network/api_services.dart';
import 'package:foodpanda_clone/models/response/restaurant_model.dart';
import 'package:foodpanda_clone/models/resquest/restaurant_request.dart';
import 'package:foodpanda_clone/res/app_url.dart';

class RestaurantRepository{
  final _apiService = ApiService();

  Future<dynamic> deleteRestaurant(id) async{
    try{
      var url = '${AppUrl.postRestaurant}/$id';

      dynamic response = await _apiService.deleteApi(url);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> putRestaurant(requestBody, id) async{
    try{
      var restaurantBody = RestaurantRequest(data: requestBody);
      var url = '${AppUrl.postRestaurant}/$id';
      dynamic response = await _apiService.putApi(url, restaurantBody.toJson());
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<RestaurantModel>getRestaurants() async{
    try{
      dynamic responses = await _apiService.getApiResponse(AppUrl.getAllRestaurant);
      //print('response ${responses["data"][0]["attributes"]["name"]}');
     // print("respone in model: ${ RestaurantModel.fromJson(responses)}");
      return RestaurantModel.fromJson(responses);
    }catch (e){
      rethrow;
    }
  }

  Future<dynamic> postRestaurant(requestBody) async{
    try{
      var restaurantBody = RestaurantRequest(data: requestBody);
      dynamic response = await _apiService.postApi(AppUrl.postRestaurant,
          restaurantBody.toJson());
      return response;
    }catch(e){
      rethrow;
    }
  }

}