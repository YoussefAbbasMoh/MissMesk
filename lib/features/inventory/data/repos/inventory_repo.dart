import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/inventory/data/data_sources/inventory_remote_data_source.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';

abstract class InventoryRepo {
  Future<ApiResult> addInventory({required AddInventoryRequestModel inventory});
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
}
