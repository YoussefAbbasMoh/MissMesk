import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/inventory/data/data_sources/inventory_remote_data_source.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';

abstract class InventoryRepo {
  Future<ApiResult> addInventory({required AddInventoryRequestModel inventory});
  Future<ApiResult<List<InventoryModel>>> getAllInventories();
  Future<ApiResult<InventoryModel>> getInventory({required String id});
  Future<ApiResult> addUnit({required String unit});
}

class InventoryRepoImpl implements InventoryRepo {
  final InventoryRemoteDataSource _inventoryRemoteDataSource;

  InventoryRepoImpl(this._inventoryRemoteDataSource);

  @override
  Future<ApiResult> addInventory({
    required AddInventoryRequestModel inventory,
  }) async {
    try {
      await _inventoryRemoteDataSource.addInventory(model: inventory);
      return ApiResult.success('تم اضافة المخزن بنجاح');
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في إضافة المخزن');
    }
  }

  @override
  Future<ApiResult<List<InventoryModel>>> getAllInventories() async {
    try {
      final response = await _inventoryRemoteDataSource.getAllInventories();
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب المخازن');
    }
  }

  @override
  Future<ApiResult<InventoryModel>> getInventory({required String id}) async {
    try {
      final response = await _inventoryRemoteDataSource.getInventory(id: id);
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب المخزن');
    }
  }

  @override
  Future<ApiResult> addUnit({required String unit}) async {
    try {
      await _inventoryRemoteDataSource.addUnit(unit: unit);
      return ApiResult.success('تم اضافة الوحدة بنجاح');
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في اضافة الوحدة');
    }
  }
}
