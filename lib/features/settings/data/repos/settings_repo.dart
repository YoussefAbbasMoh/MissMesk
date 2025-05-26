import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/settings/data/data_sources/settings_remote_data_source.dart';
import 'package:miss_misq/features/settings/data/models/get_all_accounts_response_model.dart';

abstract class SettingsRepo {
  Future<ApiResult> logout();
  Future<ApiResult<GetAllAccountsResponseModel>> getAllAccounts();
}

class SettingsRepoImpl implements SettingsRepo {
  final SettingsRemoteDataSource _settingsRemoteDataSource;

  SettingsRepoImpl(this._settingsRemoteDataSource);
  @override
  Future<ApiResult> logout() async {
    try {
      await _settingsRemoteDataSource.logout();
      await CachHelper.clear();
      await CachHelper.clearSecure();
      return ApiResult.success('تم تسجيل الخروج بنجاح');
    } catch (e) {
      return ApiResult.failure('مشكلة في تسجيل الخروج');
    }
  }

  @override
  Future<ApiResult<GetAllAccountsResponseModel>> getAllAccounts() async {
    try {
      final response = await _settingsRemoteDataSource.getAllAccounts();
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب الحسابات');
    }
  }
}
