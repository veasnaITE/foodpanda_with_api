import 'dart:convert';
import 'dart:io';

import 'package:foodpanda_clone/data/app_exception.dart';
import 'package:foodpanda_clone/res/app_url.dart';
import 'package:http/http.dart' as http;
class ApiService {
  dynamic responseJson;
  Future<dynamic> uploadImageService(url, file) async{
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.uploadImg));
    request.files.add(await http.MultipartFile.fromPath('files', file));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("hiihoif");
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<dynamic>getApiResponse(String url) async{
    try{
      var response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
      return responseJson;
    }on SocketException{
      throw FetchDataException("NO Internet connection");
    }
  }

  returnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 500:
        throw BadRequestException("Please check your request body");
    }
  }
}
