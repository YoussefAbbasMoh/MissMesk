import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;


  static Dio getDio() {
    if (dio == null) {
      dio =  Dio();
      dio!.options.baseUrl = EndPoints.baseUrl;
      dio!.options.connectTimeout = const Duration(seconds: 5);
      dio!.options.receiveTimeout = const Duration(seconds: 3);
      addDioInterceptors();
      addDioBasicHeaders();

    }
    return dio!;
  }

  static void addDioInterceptors() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }

  static void addDioBasicHeaders() {
    dio!.options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }
}
