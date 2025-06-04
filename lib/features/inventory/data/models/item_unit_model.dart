class ItemUnitModel {
  final String? id;
  final String? name;

  ItemUnitModel({this.id, this.name});

  factory ItemUnitModel.fromJson(Map<String, dynamic> json) {
    return ItemUnitModel(id: json['_id'] ?? '', name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() => {'_id': id, 'name': name};
}
