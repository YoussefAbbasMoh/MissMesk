class GetAllAccountsResponseModel {
  final List<UserAccount>? users;

  GetAllAccountsResponseModel({required this.users});

  factory GetAllAccountsResponseModel.fromJson(Map<String, dynamic> json) {
    var usersJson = json['users'] as List<dynamic>;
    List<UserAccount> usersList =
        usersJson
            .map((user) => UserAccount.fromJson(user as Map<String, dynamic>))
            .toList();

    return GetAllAccountsResponseModel(users: usersList);
  }

  Map<String, dynamic> toJson() {
    return {'users': users?.map((user) => user.toJson()).toList()};
  }
}

class UserAccount {
  final String? id;
  final String? password;
  final String? confirmPassword;
  final String? name;
  final String? role;
  final String? email;
  final bool? assets;
  final bool? inventory;
  final bool? production;
  final bool? clients;
  final bool? suppliers;
  final bool? daily;
  final bool? settings;

  UserAccount({
    this.id,
    this.name,
    this.role,
    this.email,
    this.assets,
    this.inventory,
    this.production,
    this.clients,
    this.suppliers,
    this.daily,
    this.settings,
    this.password,
    this.confirmPassword,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      assets: json['assets'] ?? false,
      inventory: json['inventory'] ?? false,
      production: json['production'] ?? false,
      clients: json['clients'] ?? false,
      suppliers: json['suppliers'] ?? false,
      daily: json['daily'] ?? false,
      settings: json['setting'] ?? false,
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null && id != '') data['id'] = id;
    if (name != null && name != '') data['name'] = name;
    if (email != null && email != '') data['email'] = email;
    if (assets != null) data['assets'] = assets;
    if (inventory != null) data['inventory'] = inventory;
    if (production != null) data['production'] = production;
    if (clients != null) data['clients'] = clients;
    if (suppliers != null) data['suppliers'] = suppliers;
    if (daily != null) data['daily'] = daily;
    if (settings != null) data['setting'] = settings;
    if (password != null && password != '') data['password'] = password;
    if (confirmPassword != null && confirmPassword != '') {
      data['confirmPassword'] = confirmPassword;
    }
    return data;
  }

  static String getPermissions(UserAccount user) {
    StringBuffer permissions = StringBuffer();
    if (user.assets ?? false) permissions.write('الأصول, ');
    if (user.inventory ?? false) permissions.write('المخزون, ');
    if (user.production ?? false) permissions.write('الإنتاج, ');
    if (user.clients ?? false) permissions.write('العملاء, ');
    if (user.suppliers ?? false) permissions.write('الموردين, ');
    if (user.daily ?? false) permissions.write('اليومية, ');
    if (user.settings ?? false) permissions.write('الاعدادات, ');
    return permissions.toString();
  }
}
