part of 'inventory_adjustments_cubit.dart';

@immutable
sealed class InventoryAdjustmentsState {}

final class InventoryAdjustmentsInitial extends InventoryAdjustmentsState {}

final class AddInventoryLoading extends InventoryAdjustmentsState {}

final class AddInventorySuccess extends InventoryAdjustmentsState {
  final String message;

  AddInventorySuccess(this.message);
}

final class AddInventoryFailure extends InventoryAdjustmentsState {
  final String message;

  AddInventoryFailure(this.message);
}
