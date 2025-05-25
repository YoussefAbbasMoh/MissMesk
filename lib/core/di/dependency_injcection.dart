import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/dio_factory.dart';
import 'package:miss_misq/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:miss_misq/features/login/data/repos/login_repo.dart';
import 'package:miss_misq/features/login/view/cubit/login_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> initDepenencyInjection() async {
  Dio dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  _setupLogin();
}

void _setupLogin() {
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(sl<LoginRemoteDataSource>()),
  );

  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(sl<LoginRepo>()));
}
