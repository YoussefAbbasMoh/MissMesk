import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/dio_factory.dart';
import 'package:miss_misq/features/inventory/data/data_sources/inventory_remote_data_source.dart';
import 'package:miss_misq/features/inventory/data/repos/inventory_repo.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory/cubit/inventory_cubit.dart';
import 'package:miss_misq/features/inventory/view/cubit/inventory_adjustments/inventory_adjustments_cubit.dart';
import 'package:miss_misq/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:miss_misq/features/login/data/repos/login_repo.dart';
import 'package:miss_misq/features/login/view/cubit/login_cubit.dart';
import 'package:miss_misq/features/settings/data/data_sources/settings_remote_data_source.dart';
import 'package:miss_misq/features/settings/data/repos/settings_repo.dart';
import 'package:miss_misq/features/settings/view/cubit/settings_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> initDepenencyInjection() async {
  Dio dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));

  _setupLogin();
  _setupSettings();
  _setupInventory();
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

void _setupSettings() {
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(sl<SettingsRemoteDataSource>()),
  );
  sl.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(sl<SettingsRepo>()),
  );
}

void _setupInventory() {
  sl.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<InventoryRepo>(
    () => InventoryRepoImpl(sl<InventoryRemoteDataSource>()),
  );
  sl.registerLazySingleton<InventoryAdjustmentsCubit>(
    () => InventoryAdjustmentsCubit(sl<InventoryRepo>()),
  );
  sl.registerLazySingleton<InventoryCubit>(
    () => InventoryCubit(sl<InventoryRepo>()),
  );
}
