import 'package:dio/dio.dart';
import 'package:miss_misq/core/networking/api_service.dart';
import 'package:miss_misq/core/networking/end_points.dart';
import 'package:miss_misq/core/networking/exceptions.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';

abstract class InventoryRemoteDataSource {
  Future addInventory({required AddInventoryRequestModel model});
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
}
