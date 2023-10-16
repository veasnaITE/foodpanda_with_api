class AppException implements Exception{
  final _prefix;
  final _message;
  AppException(this._prefix,this._message);

  @override
  String toString() {
    return 'AppException{_prefix: $_prefix, _message: $_message}';
  }
}
class FetchDataException extends AppException{
  FetchDataException(String message):super("Error During comunication",message);
}
class BadRequestException extends AppException{
  BadRequestException (String message):super ("Your Request model is not right",message);
}
