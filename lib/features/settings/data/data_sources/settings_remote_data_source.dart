import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';

abstract class SettingsRemoteDataSource {
  Future logout();

  Future<GetAllAccountsResponseModel> getAllAccounts();

  Future<UserAccount> addAccount({required UserAccount user});

  Future resetUserPassword({required String newPassword});
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

  @override
  Future<GetAllAccountsResponseModel> getAllAccounts() async {
    try {
      final response = await _apiService.get(path: EndPoints.allAccounts);
      return GetAllAccountsResponseModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw Exception('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future<UserAccount> addAccount({required UserAccount user}) async {
    try {
      final response = await _apiService.post(
        path: EndPoints.addAccount,
        data: user.toJson(),
      );

      return UserAccount.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw Exception('مشكلة في الاتصال بالسيرفر');
    }
  }

  @override
  Future resetUserPassword({required String newPassword}) async {
    try {
      return await _apiService.patch(
        path: EndPoints.resetPassword,
        data: {'password': newPassword},
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw Exception('مشكلة في الاتصال بالسيرفر');
    }
  }
}
