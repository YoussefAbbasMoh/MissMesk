import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/data/models/item_unit_model.dart';
import 'package:miss_misq/features/inventory/data/models/product_details_model.dart';
import 'package:miss_misq/features/inventory/data/models/store_keeper_model.dart';

abstract class InventoryRemoteDataSource {
  Future addInventory({required AddInventoryRequestModel model});
  Future<List<InventoryModel>> getAllInventories();
  Future<InventoryModel> getInventory({required String id});
  Future addUnit({required String unit});
  Future<List<StorekeeperModel>> getStoreKeepers();
  Future addStoreKeeper({
    required String name,
    required String phoneNumber,
    required String inventoryId,
  });
  Future deleteStoreKeeper({required String id});
  Future<List<ItemUnitModel>> getAllUnits();
  Future updateInventory({
    required AddInventoryRequestModel model,
    required String inventoryId,
  });
  Future<ProductDetailsModel> getProductDetails({required String id});
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final ApiService _apiService;

  InventoryRemoteDataSourceImpl(this._apiService);
  @override
  Future addInventory({required AddInventoryRequestModel model}) async {
    try {
      await _apiService.post(
        path: EndPoints.addInventory,
        data: model.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future<List<InventoryModel>> getAllInventories() async {
    try {
      final response = await _apiService.get(path: EndPoints.getAllInventories);
      return (response.data['inventories'] as List)
          .map((e) => InventoryModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future<InventoryModel> getInventory({required String id}) async {
    try {
      final response = await _apiService.get(
        path: EndPoints.getInventoryById(id),
      );
      return InventoryModel.fromJson(response.data['inventory']);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future addUnit({required String unit}) async {
    try {
      await _apiService.post(path: EndPoints.addUnit, data: {'name': unit});
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future<List<StorekeeperModel>> getStoreKeepers() async {
    try {
      final response = await _apiService.get(path: EndPoints.getStorekeepers);
      return (response.data['storekeepers'] as List)
          .map((e) => StorekeeperModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future addStoreKeeper({
    required String name,
    required String phoneNumber,
    required String inventoryId,
  }) async {
    try {
      await _apiService.post(
        path: EndPoints.addStorekeeper,
        data: {
          'name': name,
          'phoneNumber': phoneNumber,
          'inventoryId': inventoryId,
        },
      );
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future deleteStoreKeeper({required String id}) async {
    try {
      await _apiService.delete(path: EndPoints.deleteStorekeeper(id));
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future<List<ItemUnitModel>> getAllUnits() async {
    try {
      final response = await _apiService.get(path: EndPoints.getAllUnits);
      return (response.data['itemUnits'] as List)
          .map((e) => ItemUnitModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future updateInventory({
    required AddInventoryRequestModel model,
    required String inventoryId,
  }) async {
    try {
      await _apiService.patch(
        path: EndPoints.updateInventory(inventoryId),
        data: model.toJson(),
      );
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails({required String id}) async {
    try {
      final response = await _apiService.get(
        path: EndPoints.getProductDetails(id),
      );
      return ProductDetailsModel.fromJson(response.data['product']);
    } on DioException catch (e) {
      print(e);
      throw ServerException(
        e.response?.data['message'] ?? 'مشكلة في الاتصال بالسيرفر',
      );
    } catch (e) {
      print(e);
      throw ServerException('مشكلة في الإتصال بالسيرفر');
    }
  }
}
