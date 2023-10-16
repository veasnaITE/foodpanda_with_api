import 'dart:convert';

import 'package:foodpanda_clone/cuisines.dart';
import 'package:foodpanda_clone/data/network/api_services.dart';
import 'package:foodpanda_clone/res/app_url.dart';

class CuisineRepository {
  final _apiService = ApiService();
  Future<CuisinesModel>getAllCuisine() async{
    try{
      dynamic responses = await _apiService.getApiResponse(AppUrl.getAllCuisine);
     // print("respone in model: ${ CuisinesModel.fromJson(responses)}");
      return CuisinesModel.fromJson(responses);
    }catch (e){
      rethrow;
    }
  }
}