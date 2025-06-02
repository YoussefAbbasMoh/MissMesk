import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/data/repos/inventory_repo.dart';

part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;
  InventoryCubit(this._inventoryRepo) : super(InventoryInitial());

  List<InventoryModel>? inventories;
  InventoryModel? selectedInventory;
  String? selectedRowName;

  Future<void> getAllInventories() async {
    emit(GetAllInvintoriesLoading());
    final result = await _inventoryRepo.getAllInventories();
    if (result is Success<List<InventoryModel>>) {
      inventories = result.data;
      emit(GetAllInvintoriesSuccess(inventories!));
    } else if (result is Failure<List<InventoryModel>>) {
      emit(GetAllInvintoriesFailure(result.message));
    }
  }

  void selectInventoryByName(String name) {
    selectedInventory = inventories?.firstWhere(
      (inv) => inv.name == name,
      orElse: () => InventoryModel(),
    );
    selectedRowName = null;
    emit(GetAllInvintoriesSuccess(inventories!));
    getInventory(id: selectedInventory!.id!);
  }

  void selectRowName(String? rowName) {
    selectedRowName = rowName;
    emit(GetAllInvintoriesSuccess(inventories!));
  }

  Future<void> getInventory({required String id}) async {
    emit(GetInventoryLoading());
    final result = await _inventoryRepo.getInventory(id: id);
    if (result is Success<InventoryModel>) {
      emit(GetInventorySuccess(result.data));
    } else if (result is Failure<InventoryModel>) {
      emit(GetInventoryFailure(result.message));
    }
  }
}
