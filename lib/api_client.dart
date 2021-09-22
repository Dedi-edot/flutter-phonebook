import 'package:dio/dio.dart';

class Client{
  Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = "https://phone-book-api.herokuapp.com/api/";
    return _dio;
  }
}