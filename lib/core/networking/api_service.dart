import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  static ApiService? _instance;

  factory ApiService(Dio dio) {
    return _instance ??= ApiService._internal(dio);
  }

  ApiService._internal(this._dio);

  Future<Response> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {..._dio.options.headers, if (headers != null) ...headers},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: Options(
          headers: {..._dio.options.headers, if (headers != null) ...headers},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch({
    required String path,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        options: Options(
          headers: {..._dio.options.headers, if (headers != null) ...headers},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    required String path,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        options: Options(
          headers: {..._dio.options.headers, if (headers != null) ...headers},
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
