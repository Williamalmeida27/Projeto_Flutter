import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonPlaceHolderDioCustom {
  final _dio = Dio();

  Dio get baseUrl => _dio;

  JsonPlaceHolderDioCustom() {
    _dio.options.baseUrl =
        dotenv.get('JSONPLACERHOLDER', fallback: 'sane-default');
  }
}
