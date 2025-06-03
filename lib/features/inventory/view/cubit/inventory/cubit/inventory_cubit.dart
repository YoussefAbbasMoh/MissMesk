import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_misq/core/networking/api_result.dart';
import 'package:miss_misq/features/inventory/data/models/inventory_model.dart';
import 'package:miss_misq/features/inventory/data/models/product_model.dart';
import 'package:miss_misq/features/inventory/data/repos/inventory_repo.dart';

part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;
  InventoryCubit(this._inventoryRepo) : super(InventoryInitial());

  List<InventoryModel>? _inventories;
  InventoryModel? _selectedInventory;
  String? _selectedRowName;
  String? _selectedProductType;

  List<InventoryModel>? get inventories => _inventories;
  InventoryModel? get selectedInventory => _selectedInventory;
  String? get selectedRowName => _selectedRowName;
  String? get selectedProductType => _selectedProductType;

  Future<void> getAllInventories() async {
    emit(GetAllInvintoriesLoading());

    _inventories = null;
    _selectedInventory = null;
    _selectedRowName = null;

    final result = await _inventoryRepo.getAllInventories();

    if (result is Success<List<InventoryModel>>) {
      _inventories = result.data;
      emit(GetAllInvintoriesSuccess(_inventories!));
    } else if (result is Failure<List<InventoryModel>>) {
      emit(GetAllInvintoriesFailure(result.message));
    }
  }

  Future<void> selectInventoryByName(String name) async {
    final foundInventory = _inventories?.firstWhere(
      (inv) => inv.name == name,
      orElse: () => InventoryModel(),
    );

    _selectedInventory = foundInventory?.id != null ? foundInventory : null;
    _selectedRowName = null;

    emit(
      InventorySelectionState(
        inventories: _inventories ?? [],
        selectedInventory: _selectedInventory,
        selectedRowName: _selectedRowName,
        products: _selectedInventory?.product,
      ),
    );

    if (_selectedInventory?.id != null) {
      await getInventory(id: _selectedInventory!.id!);
    }
  }

  void selectRowName(String? rowName) {
    _selectedRowName = rowName?.trim();
    final products = _selectedInventory?.product ?? [];

    final filtered =
        products
            .where((product) => product.rowName?.trim() == _selectedRowName)
            .toList();

    emit(
      InventorySelectionState(
        inventories: _inventories ?? [],
        selectedInventory: _selectedInventory,
        selectedRowName: _selectedRowName,
        products: filtered,
      ),
    );
  }

  void selectProductType(String? productType) {
    if (_selectedInventory == null ||
        productType == _selectedProductType ||
        productType == null) {
      return;
    }

    final products = _selectedInventory?.product ?? [];

    if (productType == 'الكل') {
      _selectedProductType = null;
      _selectedRowName = null;

      emit(
        InventorySelectionState(
          inventories: _inventories ?? [],
          selectedInventory: _selectedInventory,
          selectedRowName: null,
          products: products,
        ),
      );
      return;
    }

    _selectedProductType = productType.trim();

    final filtered =
        products.where((product) {
          final matchesRow =
              _selectedRowName == null ||
              product.rowName?.trim() == _selectedRowName;
          final matchesType =
              product.productType?.trim() == _selectedProductType;
          return matchesRow && matchesType;
        }).toList();

    emit(
      InventorySelectionState(
        inventories: _inventories ?? [],
        selectedInventory: _selectedInventory,
        selectedRowName: _selectedRowName,
        products: filtered,
      ),
    );
  }

  Future<void> getInventory({required String id}) async {
    emit(GetInventoryLoading());

    final result = await _inventoryRepo.getInventory(id: id);

    if (result is Success<InventoryModel>) {
      _selectedInventory = result.data;

      final filteredProducts =
          _selectedRowName == null
              ? result.data.product
              : result.data.product
                  ?.where((p) => p.rowName?.trim() == _selectedRowName)
                  .toList();

      emit(
        InventorySelectionState(
          inventories: _inventories ?? [],
          selectedInventory: _selectedInventory,
          selectedRowName: _selectedRowName,
          products: filteredProducts,
        ),
      );
    } else if (result is Failure<InventoryModel>) {
      emit(GetInventoryFailure(result.message));
    }
  }
}
