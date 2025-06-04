class ProductModel {
  final String? id;
  final String? code;
  final String? productType;
  final String? description;
  final String? inventoryId;
  final String? rowName;
  final String? name;
  final String? productContainer;
  final int? minCount;
  final int? quantity;

  ProductModel({
    this.id,
    this.code,
    this.productType,
    this.description,
    this.inventoryId,
    this.rowName,
    this.name,
    this.productContainer,
    this.minCount,
    this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json.containsKey('_id') ? json['_id'] : null,
      code: json.containsKey('code') ? json['code'] : null,
      productType: json.containsKey('productType') ? json['productType'] : null,
      description: json.containsKey('description') ? json['description'] : null,
      inventoryId: json.containsKey('inventoryId') ? json['inventoryId'] : null,
      rowName: json.containsKey('rowName') ? json['rowName'] : null,
      name: json.containsKey('name') ? json['name'] : null,
      productContainer: json.containsKey('productContainer') ? json['productContainer'] : null,
      minCount: json.containsKey('minCount') ? json['minCount'] : null,
      quantity: json.containsKey('quantity') ? json['quantity'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'code': code,
      'productType': productType,
      'description': description,
      'inventoryId': inventoryId,
      'rowName': rowName,
      'name': name,
      'productContainer': productContainer,
      'minCount': minCount,
      'quantity': quantity,
    };
  }
}
