import 'package:flutter/foundation.dart';
import 'package:foodpanda_clone/data/response/api_response.dart';
import 'package:foodpanda_clone/models/response/cuisine_model.dart';
import 'package:foodpanda_clone/models/response/restaurant_model.dart';
import 'package:foodpanda_clone/repositories/restaurant_repository.dart';

class RestaurantViewModel extends ChangeNotifier{
  final _restaurantRepo = RestaurantRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();
  setRestaurantList(response){
    this.response =response;
    notifyListeners();
  }
  Future<RestaurantModel?>getAllRestaurant() async{
    await _restaurantRepo.getRestaurants()
        .then((restaurants){
          //print("response in viewmodel: ${restaurants.data?.length}");
          setRestaurantList(ApiResponse.completed(restaurants));
    })
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }
}