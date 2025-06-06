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

final class InventoryAdjustmentsGetStoreKeepersLoading extends InventoryAdjustmentsState {}

final class InventoryAdjustmentsGetStoreKeepersSuccess extends InventoryAdjustmentsState {
  final List<StorekeeperModel> storekeepers;

  InventoryAdjustmentsGetStoreKeepersSuccess(this.storekeepers);
}

final class InventoryAdjustmentsGetStoreKeepersFailure extends InventoryAdjustmentsState {
  final String message;

  InventoryAdjustmentsGetStoreKeepersFailure(this.message);
}

final class AddStoreKeeperLoading extends InventoryAdjustmentsState {}

final class AddStoreKeeperSuccess extends InventoryAdjustmentsState {
  final String message;

  AddStoreKeeperSuccess(this.message);
}

final class AddStoreKeeperFailure extends InventoryAdjustmentsState {
  final String message;

  AddStoreKeeperFailure(this.message);
}

final class DeleteStoreKeeperLoading extends InventoryAdjustmentsState {}

final class DeleteStoreKeeperSuccess extends InventoryAdjustmentsState {
  final String message;

  DeleteStoreKeeperSuccess(this.message);
}

final class DeleteStoreKeeperFailure extends InventoryAdjustmentsState {
  final String message;

  DeleteStoreKeeperFailure(this.message);
}

final class InventoryAdjustmentsGetAllUnitsLoading extends InventoryAdjustmentsState {}

final class InventoryAdjustmentsGetAllUnitsSuccess extends InventoryAdjustmentsState {
  final List<ItemUnitModel> units;

  InventoryAdjustmentsGetAllUnitsSuccess(this.units);
}

final class InventoryAdjustmentsGetAllUnitsFailure extends InventoryAdjustmentsState {
  final String message;

  InventoryAdjustmentsGetAllUnitsFailure(this.message);
}

final class UpdateInventoryLoading extends InventoryAdjustmentsState {}

final class UpdateInventorySuccess extends InventoryAdjustmentsState {
  final String message;

  UpdateInventorySuccess(this.message);
}

final class UpdateInventoryFailure extends InventoryAdjustmentsState {
  final String message;

  UpdateInventoryFailure(this.message);
}