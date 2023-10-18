import 'dart:convert';
import 'dart:io';

import 'package:foodpanda_clone/data/app_exception.dart';
import 'package:foodpanda_clone/models/response/image_resquest.dart';
import 'package:http/http.dart' as http;
class ApiService {
  dynamic responseJson;

  Future<dynamic> deleteApi(url) async {
    var request = http.Request('DELETE', Uri.parse(url));
    var response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return true;
    } else {
      // print(response.reasonPhrase);
      return false;
    }
  }

  Future putApi(String url, requestBody) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      return true;
    } else {
      // print(response.reasonPhrase);
      return false;
    }
  }

  Future postApi(String url, requestBody) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);
    var response = await request.send();
  print('statusu ${response.statusCode}');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future uploadImage(String url, file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', file));
    var response = await request.send();
    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      var imageList = imageModelFromJson(res);
      print( imageList[0]);
      return imageList[0];
    } else {
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
