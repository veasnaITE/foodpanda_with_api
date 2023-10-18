import 'package:flutter/foundation.dart';
import 'package:foodpanda_clone/data/response/api_response.dart';
import 'package:foodpanda_clone/models/response/restaurant_model.dart';
import 'package:foodpanda_clone/repositories/restaurant_repository.dart';

class RestaurantViewModel extends ChangeNotifier{
  final _restaurantRepo = RestaurantRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();
  setRestaurantList(response){
    this.response =response;
    notifyListeners();
  }

  Future<dynamic> deleteRestaurant(id) async{
    setRestaurantList(ApiResponse.loading());
    await _restaurantRepo.deleteRestaurant(id)
        .then((res) {
      setRestaurantList(ApiResponse.completed(res));
    }
    )
        .onError((error, stackTrace) {
      setRestaurantList(ApiResponse.error(error.toString()));
    });
  }

  Future<dynamic> putRestaurant(requestBody, id) async{
    setRestaurantList(ApiResponse.loading());
    await _restaurantRepo.putRestaurant(requestBody, id)
        .then((value) => setRestaurantList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(error.toString())));
  }

  Future<dynamic> postRestaurant(requestBody) async{
    setRestaurantList(ApiResponse.loading());
    await _restaurantRepo.postRestaurant(requestBody)
        .then((value) => setRestaurantList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setRestaurantList(ApiResponse.error(error.toString())));
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