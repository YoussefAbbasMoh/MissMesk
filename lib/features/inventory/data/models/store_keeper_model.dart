class StorekeeperModel {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final _Inventory? inventory;

  StorekeeperModel({this.id, this.name, this.inventory, this.phoneNumber});

  factory StorekeeperModel.fromJson(Map<String, dynamic> json) {
    return StorekeeperModel(
      id: json.containsKey('_id') ? json['_id'] : '',
      name: json.containsKey('name') ? json['name'] : '',
      phoneNumber: json.containsKey('phoneNumber') ? json['phoneNumber'] : '',
      inventory:
          json.containsKey('inventory')
              ? _Inventory.fromJson(json['inventory'] ?? {})
              : _Inventory(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'phoneNumber': phoneNumber,
    'inventory': inventory?.toJson(),
  };
}

class _Inventory {
  final String? id;
  final String? name;

  _Inventory({this.id, this.name});

  factory _Inventory.fromJson(Map<String, dynamic> json) {
    return _Inventory(
      id: json.containsKey('_id') ? json['_id'] : '',
      name: json.containsKey('name') ? json['name'] : '',
    );
  }

  Map<String, dynamic> toJson() => {'_id': id, 'name': name};
}
