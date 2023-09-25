import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/repositories/back4app_repository/back4_app_interceptors.dart';

class CustomBack4AppDio {
  var _dio = Dio();

  get dio => _dio;

  CustomBack4AppDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BASEURL");
    _dio.interceptors.add(Back4AppInterceptors());
  }
}
