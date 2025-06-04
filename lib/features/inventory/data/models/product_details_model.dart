class ProductDetailsModel {
  final String? id;
  final String? code;
  final String? productType;
  final InventoryIdModel? inventoryId;
  final String? description;
  final String? rowName;
  final String? name;
  final String? productionContainer;
  final int? minCount;
  final int? quntity;
  final List<AvailableQuantityModel>? availableQuantity;
  final String? createdAt;

  ProductDetailsModel({
    this.id,
    this.code,
    this.productType,
    this.inventoryId,
    this.description,
    this.rowName,
    this.name,
    this.productionContainer,
    this.minCount,
    this.quntity,
    this.availableQuantity,
    this.createdAt,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] ?? '',
      code = json['code'] ?? '',
      productType = json['productType'] ?? '',
      inventoryId =
          json['inventoryId'] != null
              ? InventoryIdModel.fromJson(json['inventoryId'])
              : InventoryIdModel(),
      description = json['description'] ?? '',
      rowName = json['rowName'] ?? '',
      name = json['name'] ?? '',
      productionContainer = json['productionContainer'] ?? '',
      minCount = json['minCount'] ?? 0,
      quntity = json['quntity'] ?? 0,
      availableQuantity =
          json['availableQuantity'] != null
              ? (json['availableQuantity'] as List)
                  .map((i) => AvailableQuantityModel.fromJson(i))
                  .toList()
              : [],
      createdAt = json['createdAt'] ?? '0000-00-00T00:00:00.000Z';
}

class InventoryIdModel {
  final String? id;
  final String? name;
  final int? number;
  final String? address;
  final List<dynamic>? storekeeper;

  InventoryIdModel({
    this.id,
    this.name,
    this.number,
    this.address,
    this.storekeeper,
  });

  InventoryIdModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] ?? '',
      name = json['name'] ?? '',
      number = json['number'] ?? '',
      address = json['address'] ?? '',
      storekeeper = json['storekeeper'] ?? '';

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'number': number,
    'address': address,
    'storekeeper': storekeeper,
  };
}

class AvailableQuantityModel {
  final String? code;
  final String? supplier;
  final int? quantity;
  final int? totalPrice;
  final int? unitPrice;
  final String? state;
  final String? registeredBy;
  final String? notes;
  final String? numberOfAdditions;
  final String? id;
  final String? date;

  AvailableQuantityModel({
    this.code,
    this.supplier,
    this.quantity,
    this.totalPrice,
    this.unitPrice,
    this.state,
    this.registeredBy,
    this.notes,
    this.numberOfAdditions,
    this.id,
    this.date,
  });

  AvailableQuantityModel.fromJson(Map<String, dynamic> json)
    : code = json['code'] ?? '',
      supplier = json['supplier'] ?? '',
      quantity = json['quantity'] ?? 0,
      totalPrice = json['totalPrice'] ?? 0,
      unitPrice = json['unitPrice'] ?? 0,
      state = json['state'] ?? '',
      registeredBy = json['registeredBy'] ?? '',
      notes = json['notes'] ?? '',
      numberOfAdditions = json['numberOfAdditions'] ?? '',
      id = json['_id'] ?? '' , date = json['date'] ?? '';

  Map<String, dynamic> toJson() => {
    'code': code,
    'supplier': supplier,
    'quantity': quantity,
    'totalPrice': totalPrice,
    'unitPrice': unitPrice,
    'state': state,
    'registeredBy': registeredBy,
    'notes': notes,
    'numberOfAdditions': numberOfAdditions,
    '_id': id,
    'date': date
  };
}
