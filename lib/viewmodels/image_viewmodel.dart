import 'package:flutter/material.dart';
import 'package:foodpanda_clone/data/response/api_response.dart';
import 'package:foodpanda_clone/repositories/image_repository.dart';

class ImageViewModel extends ChangeNotifier {
  final _imageRepo = ImageRepository();
  ApiResponse<dynamic> response = ApiResponse.loading();

  void setImage(ApiResponse<dynamic> response) {
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> uploadImage(dynamic file) async {
    await _imageRepo.uploadImage(file)
        .then((value) => setImage(ApiResponse.completed(value)))
        .onError((error, stackTrace) => setImage(ApiResponse.error(stackTrace.toString())));
  }
}