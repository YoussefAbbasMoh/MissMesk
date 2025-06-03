part of 'inventory_adjustments_cubit.dart';

@immutable
sealed class InventoryAdjustmentsState {}

final class InventoryAdjustmentsInitial extends InventoryAdjustmentsState {}

final class InventoryAdjustmentsGetAllInventoriesLoading extends InventoryAdjustmentsState {}

final class InventoryAdjustmentsGetAllInventoriesSuccess extends InventoryAdjustmentsState {
  final List<InventoryModel> inventories;

  InventoryAdjustmentsGetAllInventoriesSuccess(this.inventories);
}

final class InventoryAdjustmentsGetAllInventoriesFailure extends InventoryAdjustmentsState {
  final String message;

  InventoryAdjustmentsGetAllInventoriesFailure(this.message);
}


final class AddInventoryLoading extends InventoryAdjustmentsState {}

final class AddInventorySuccess extends InventoryAdjustmentsState {
  final String message;

  AddInventorySuccess(this.message);
}

final class AddInventoryFailure extends InventoryAdjustmentsState {
  final String message;

  AddInventoryFailure(this.message);
}

final class AddUnitLoading extends InventoryAdjustmentsState {}

final class AddUnitSuccess extends InventoryAdjustmentsState {
  final String message;

  AddUnitSuccess(this.message);
}

final class AddUnitFailure extends InventoryAdjustmentsState {
  final String message;

  AddUnitFailure(this.message);
}

