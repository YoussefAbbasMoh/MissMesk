class StorekeeperModel {
  final String? id;
  final String? name;

  StorekeeperModel({this.id, this.name});

  factory StorekeeperModel.fromJson(Map<String, dynamic> json) {
    return StorekeeperModel(
      id: json.containsKey('_id') ? json['_id'] : null,
      name: json.containsKey('name') ? json['name'] : null,
    );
  }
}