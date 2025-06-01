import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';

abstract class SettingsRemoteDataSource {
  Future logout();

  Future<GetAllAccountsResponseModel> getAllAccounts();

  Future addAccount({required UserAccount user});

  Future updateAccount({required UserAccount user});

  Future deletAccount({required String id});
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiService _apiService;

  SettingsRemoteDataSourceImpl(this._apiService);

  @override
  Future logout() async {
    try {
      return await _apiService.get(path: EndPoints.logout);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future<GetAllAccountsResponseModel> getAllAccounts() async {
    try {
      final response = await _apiService.get(path: EndPoints.allAccounts);
      return GetAllAccountsResponseModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future addAccount({required UserAccount user}) async {
    try {
      return await _apiService.post(
        path: EndPoints.addAccount,
        data: user.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future updateAccount({required UserAccount user}) async {
    try {
      return await _apiService.patch(
        path: EndPoints.resetPassword,
        data: user.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future deletAccount({required String id}) async {
    try {
      return await _apiService.delete(path: '${EndPoints.deleteAccount}/$id');
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الاتصال بالسيرفر');
    }
  }
}
