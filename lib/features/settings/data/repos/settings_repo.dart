import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/features/settings/data/data_sources/settings_remote_data_source.dart';

abstract class SettingsRepo {
  Future<ApiResult> logout();
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
      print('تم تسجيل الخروج بنجاح');
      return ApiResult.success('تم تسجيل الخروج بنجاح');
    } catch (e) {
      print(e);
      return ApiResult.failure('مشكلة في تسجيل الخروج');
    }
  }
}
