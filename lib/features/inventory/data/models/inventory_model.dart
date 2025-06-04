import 'package:miss_misq/features/inventory/data/models/product_model.dart';
import 'package:miss_misq/features/inventory/data/models/store_keeper_model.dart';

class InventoryModel {
  final String? id;
  final String? name;
  final int? number;
  final String? address;
  final int? rowsNumber;
  final List<String>? rowsName;
  final List<ProductModel>? product;
  final List<StorekeeperModel>? storekeeper;

  InventoryModel({
    this.id,
    this.name,
    this.number,
    this.address,
    this.rowsNumber,
    this.rowsName,
    this.product,
    this.storekeeper,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json.containsKey('_id') ? json['_id'] : null,
      name: json.containsKey('name') ? json['name'] : null,
      number: json.containsKey('number') ? json['number'] : null,
      address: json.containsKey('address') ? json['address'] : null,
      rowsNumber: json.containsKey('rowsNumber') ? json['rowsNumber'] : null,
      rowsName:
          json.containsKey('rowsName')
              ? List<String>.from(json['rowsName'])
              : [],
      product:
          json.containsKey('product')
              ? (json['product'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList()
              : [],
      storekeeper:
          json.containsKey('storekeeper')
              ? (json['storekeeper'] as List)
                  .map((e) => StorekeeperModel.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null && id != '') data['_id'] = id;
    if (name != null && name != '') data['name'] = name;
    if (number != null) data['number'] = number;
    if (address != null && address != '') data['address'] = address;
    if (rowsNumber != null) data['rowsNumber'] = rowsNumber;
    if (rowsName != null && rowsName!.isNotEmpty) data['rowsName'] = rowsName;
    if (product != null && product!.isNotEmpty) {
      data['product'] = product!.map((e) => e.toJson()).toList();
    }
    if (storekeeper != null && storekeeper!.isNotEmpty) {
      data['storekeeper'] = storekeeper!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
