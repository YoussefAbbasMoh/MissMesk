import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/inventory/data/models/add_inventory_request_model.dart';
import 'package:miss_misq/features/inventory/data/repos/inventory_repo.dart';
part 'inventory_adjustments_state.dart';

class InventoryAdjustmentsCubit extends Cubit<InventoryAdjustmentsState> {
  final InventoryRepo _inventoryRepo;
  InventoryAdjustmentsCubit(this._inventoryRepo)
    : super(InventoryAdjustmentsInitial());

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
}
