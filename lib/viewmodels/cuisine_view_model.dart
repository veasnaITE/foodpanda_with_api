import 'package:flutter/cupertino.dart';
import 'package:foodpanda_clone/data/response/api_response.dart';
import 'package:foodpanda_clone/models/response/cuisine_model.dart';
import 'package:foodpanda_clone/repositories/cuisine_repository.dart';

class CuisineViewModel extends ChangeNotifier{
  final _cuisineRepo =CuisineRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();
  setCuisineList(response){
    this.response=response;
    notifyListeners();
  }
  Future<CuisinesModel?>getAllCuisines() async{
    await _cuisineRepo.getAllCuisine()
        .then((cuisines){
          //print("respone in viewmodel: ${cuisines.data?.length}");
          setCuisineList(ApiResponse.completed(cuisines));
        })
        .onError((error, stackTrace) => setCuisineList(ApiResponse.error(stackTrace.toString())));
  }
}