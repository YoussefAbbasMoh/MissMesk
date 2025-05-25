import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/login/data/models/login_respoonse_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginRespoonseModel> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);
  @override
  Future<LoginRespoonseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _apiService.post(
        path: EndPoints.login,
        data: {'email': email, 'password': password},
      );
      return LoginRespoonseModel.fromJson(result.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }
}
