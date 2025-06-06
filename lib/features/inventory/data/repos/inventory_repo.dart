import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/inventory/data/data_sources/inventory_remote_data_source.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/data/models/item_unit_model.dart';
import 'package:miss_misq/features/inventory/data/models/product_details_model.dart';
import 'package:miss_misq/features/inventory/data/models/store_keeper_model.dart';

abstract class InventoryRepo {
  Future<ApiResult> addInventory({required AddInventoryRequestModel inventory});
  Future<ApiResult<List<InventoryModel>>> getAllInventories();
  Future<ApiResult<InventoryModel>> getInventory({required String id});
  Future<ApiResult> addUnit({required String unit});
  Future<ApiResult<List<StorekeeperModel>>> getStoreKeepers();
  Future<ApiResult> addStoreKeeper({
    required String name,
    required String phoneNumber,
    required String inventoryId,
  });
  Future<ApiResult> deleteStoreKeeper({required String id});
  Future<ApiResult<List<ItemUnitModel>>> getAllUnits();
  Future<ApiResult> updateInventory({
    required AddInventoryRequestModel model,
    required String inventoryId,
  });
  Future<ApiResult<ProductDetailsModel>> getProductDetails({
    required String id,
  });
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

  @override
  Future<ApiResult<List<StorekeeperModel>>> getStoreKeepers() async {
    try {
      final response = await _inventoryRemoteDataSource.getStoreKeepers();
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب أمناء المخازن');
    }
  }

  @override
  Future<ApiResult> addStoreKeeper({
    required String name,
    required String phoneNumber,
    required String inventoryId,
  }) async {
    try {
      await _inventoryRemoteDataSource.addStoreKeeper(
        name: name,
        phoneNumber: phoneNumber,
        inventoryId: inventoryId,
      );
      return ApiResult.success('تم اضافة أمين المخزن بنجاح');
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في اضافة أمين المخزن');
    }
  }

  @override
  Future<ApiResult> deleteStoreKeeper({required String id}) async {
    try {
      await _inventoryRemoteDataSource.deleteStoreKeeper(id: id);
      return ApiResult.success('تم حذف أمين المخزن بنجاح');
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في حذف أمين المخزن');
    }
  }

  @override
  Future<ApiResult<List<ItemUnitModel>>> getAllUnits() async {
    try {
      final response = await _inventoryRemoteDataSource.getAllUnits();
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب الوحدات');
    }
  }

  @override
  Future<ApiResult> updateInventory({
    required AddInventoryRequestModel model,
    required String inventoryId,
  }) async {
    try {
      await _inventoryRemoteDataSource.updateInventory(
        model: model,
        inventoryId: inventoryId,
      );
      return ApiResult.success('تم تحديث المخزن بنجاح');
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في تحديث المخزن');
    }
  }

  @override
  Future<ApiResult<ProductDetailsModel>> getProductDetails({
    required String id,
  }) async {
    try {
      final response = await _inventoryRemoteDataSource.getProductDetails(
        id: id,
      );
      return ApiResult.success(response);
    } on ServerException catch (e) {
      return ApiResult.failure(e.message);
    } catch (e) {
      return ApiResult.failure('مشكلة في جلب بيانات المنتج');
    }
  }
}
