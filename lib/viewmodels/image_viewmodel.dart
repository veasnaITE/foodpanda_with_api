import 'package:flutter/material.dart';
import 'package:foodpanda_clone/data/response/api_response.dart';
import 'package:foodpanda_clone/data/response/status.dart';
import 'package:foodpanda_clone/repositories/image_repository.dart';

class ImageViewModel extends ChangeNotifier {
  final _imageRepo = ImageRepository();
  dynamic image = ApiResponse();
  setImageResponse(response){
    if(response.data == null) {
      image.status = Status.LOADING;
    } else{
      image = response;
    }
    notifyListeners();
  }
  Future<dynamic> uploadImage(file) async {
    setImageResponse(ApiResponse.loading());
    await _imageRepo.uploadImage(file)
        .then((image) => setImageResponse(ApiResponse.completed(image)))
        .onError((error, stackTrace) => setImageResponse(ApiResponse.error(error.toString())));
  }

}