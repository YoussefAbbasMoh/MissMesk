import 'dart:convert';
import 'package:miss_misq/core/networking/cache_helper.dart';
import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/features/home/models/side_menu_item_model.dart';

class AccessService {
  static List<dynamic> getUserAccessablePages() {
    List accessablePages = [];
    final data = jsonDecode(CachHelper.getString(key: 'user') ?? '{}');
    if (data['role'] == 'admin') return menuItems;

    for (var item in menuItems) {
      if (data[item.key] == true) {
        accessablePages.add(item);
      }
    }
    return accessablePages;
  }

  static Future<bool> isLoggedIn() async =>
      await CachHelper.getSecure(key: 'token') != null;

  static Future<(String route, int index)> getFirstAccessablePage() async {
    final data = jsonDecode(CachHelper.getString(key: 'user') ?? '{}');
    if (!await isLoggedIn()) return (AppRoutes.login, 0);
    if (data['role'] == 'admin') return (AppRoutes.home, 0);

    for (int i = 0; i < menuItems.length; i++) {
      final item = menuItems[i];
      if (data[item.key] == true) {
        return (item.route, i);
      }
    }

    return (AppRoutes.home, 0);
  }

  static bool isAdmin() {
    final data = jsonDecode(CachHelper.getString(key: 'user') ?? '{}');
    return data['role'] == 'admin';
  }
}
