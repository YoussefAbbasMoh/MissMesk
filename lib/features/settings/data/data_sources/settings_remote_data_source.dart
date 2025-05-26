import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';

abstract class SettingsRemoteDataSource {
  Future logout();

  // todo: check here if you face any problem with logout
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiService _apiService;

  SettingsRemoteDataSourceImpl(this._apiService);

  @override
  Future logout() async {
    try {
      return await _apiService.get(path: EndPoints.logout);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw Exception('مشكلة في الاتصال بالسيرفر');
    }
  }
}
