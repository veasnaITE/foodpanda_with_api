import 'package:foodpanda_clone/data/network/api_services.dart';
import 'package:foodpanda_clone/models/response/image_resquest.dart';
import 'package:foodpanda_clone/res/app_url.dart';

class ImageRepository{
  final _apiService = ApiService();
  Future<ImageModel> uploadImage(file) async{
    try{
      dynamic response = await _apiService.uploadImage(AppUrl.uploadImg, file);
      print(response);
      return response;
    }catch(e){
      rethrow;
    }
  }
}
