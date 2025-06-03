part of 'inventory_cubit.dart';

@immutable
sealed class InventoryState {}

final class InventoryInitial extends InventoryState {}

final class GetAllInvintoriesLoading extends InventoryState {}

final class GetAllInvintoriesSuccess extends InventoryState {
  final List<InventoryModel> inventories;
  GetAllInvintoriesSuccess(this.inventories);
}

final class GetAllInvintoriesFailure extends InventoryState {
  final String message;
  GetAllInvintoriesFailure(this.message);
}

final class InventorySelectionState extends InventoryState {
  final InventoryModel? selectedInventory;
  final String? selectedRowName;
  final List<InventoryModel> inventories;
  final String? selectedProductType;
  final List<ProductModel>? products;

  InventorySelectionState({
    required this.inventories,
    required this.selectedInventory,
    required this.selectedRowName,
    this.selectedProductType,
    this.products,
  });
}

final class GetInventoryLoading extends InventoryState {}

final class GetInventorySuccess extends InventoryState {
  final InventoryModel inventory;
  GetInventorySuccess(this.inventory);
}

final class GetInventoryFailure extends InventoryState {
  final String message;
  GetInventoryFailure(this.message);
}
