class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? role;
  final bool? inventory;
  final bool? assets;
  final bool? production;
  final bool? clients;
  final bool? suppliers;
  final bool? daily;
  final bool? setting;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.inventory,
    required this.assets,
    required this.production,
    required this.clients,
    required this.suppliers,
    required this.daily,
    required this.setting,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      inventory: json['inventory'] ?? false,
      assets: json['assets'] ?? false,
      production: json['production'] ?? false,
      clients: json['clients'] ?? false,
      suppliers: json['suppliers'] ?? false,
      daily: json['daily'] ?? false,
      setting: json['setting'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'inventory': inventory,
      'assets': assets,
      'production': production,
      'clients': clients,
      'suppliers': suppliers,
      'daily': daily,
      'setting': setting,
    };
  }
}
