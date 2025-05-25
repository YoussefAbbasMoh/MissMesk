import 'dart:convert';

import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:miss_misq/features/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<ApiResult> login({required String email, required String password});
}

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _remoteDataSource;

  LoginRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      await CachHelper.setSecure(key: 'token', value: response.token);
      CachHelper.set(key: 'user', value: jsonEncode(response.user.toJson()));
      return ApiResult.success(response.user);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في الاتصال بالسيرفر');
    }
  }
}
