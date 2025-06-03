import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/data/models/store_keeper_model.dart';
import 'package:miss_misq/features/inventory/data/repos/inventory_repo.dart';
part 'inventory_adjustments_state.dart';

class InventoryAdjustmentsCubit extends Cubit<InventoryAdjustmentsState> {
  final InventoryRepo _inventoryRepo;
  InventoryAdjustmentsCubit(this._inventoryRepo)
    : super(InventoryAdjustmentsInitial());

  List<InventoryModel> _inventories = [];

  List<InventoryModel> get inventories => _inventories;

  Future<void> getAllInventories() async {
    emit(InventoryAdjustmentsGetAllInventoriesLoading());

    final result = await _inventoryRepo.getAllInventories();
    if (result is Success<List<InventoryModel>>) {
      _inventories = result.data;
      emit(InventoryAdjustmentsGetAllInventoriesSuccess(_inventories));
    } else if (result is Failure<List<InventoryModel>>) {
      emit(InventoryAdjustmentsGetAllInventoriesFailure(result.message));
    }
  }

  Future<void> addInventory({
    required AddInventoryRequestModel inventory,
  }) async {
    emit(AddInventoryLoading());
    final result = await _inventoryRepo.addInventory(inventory: inventory);
    if (result is Success) {
      emit(AddInventorySuccess(result.data));
    } else if (result is Failure) {
      emit(AddInventoryFailure(result.message));
    }
  }

  Future<void> addUnit({required String unit}) async {
    emit(AddUnitLoading());
    final result = await _inventoryRepo.addUnit(unit: unit);
    if (result is Success) {
      emit(AddUnitSuccess(result.data));
    } else if (result is Failure) {
      emit(AddUnitFailure(result.message));
    }
  }

  Future<void> getStoreKeepers() async {
    emit(InventoryAdjustmentsGetStoreKeepersLoading());
    final result = await _inventoryRepo.getStoreKeepers();
    if (result is Success<List<StorekeeperModel>>) {
      emit(InventoryAdjustmentsGetStoreKeepersSuccess(result.data));
    } else if (result is Failure<List<StorekeeperModel>>) {
      emit(InventoryAdjustmentsGetStoreKeepersFailure(result.message));
    }
  }

  Future<void> addStoreKeeper({
    required String inventoryId,
    required String name,
    required String phoneNumber,
  }) async {
    emit(AddStoreKeeperLoading());
    final result = await _inventoryRepo.addStoreKeeper(
      name: name,
      phoneNumber: phoneNumber,
      inventoryId: inventoryId,
    );
    if (result is Success) {
      emit(AddStoreKeeperSuccess(result.data));
    } else if (result is Failure) {
      emit(AddStoreKeeperFailure(result.message));
    }
  }
}
