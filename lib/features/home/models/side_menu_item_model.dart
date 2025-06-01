import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';

class SideMenuButtonModel {
  final String title;
  final String iconPath;
  final List<SideMenuSubItemModel>? subItems;
  final String route;
  final String? key;

  SideMenuButtonModel({
    required this.title,
    required this.iconPath,
    this.subItems,
    required this.route,
    this.key,
  });
}

class SideMenuSubItemModel {
  final String title;
  final String route;

  SideMenuSubItemModel({required this.title, required this.route});
}

List<SideMenuButtonModel> menuItems = [
  SideMenuButtonModel(
    title: 'الصفحة الرئيسية',
    iconPath: AssetsManager.home,
    route: AppRoutes.home,
  ),

  SideMenuButtonModel(
    title: 'إدارة المخزون والمنتجات',
    iconPath: AssetsManager.management,
    key: 'inventory',
    route: AppRoutes.inventory,
    subItems: [
      SideMenuSubItemModel(title: 'المخزون', route: AppRoutes.inventory),
      SideMenuSubItemModel(
        title: 'سجلات الجرد',
        route: AppRoutes.inventoryRecords,
      ),
      SideMenuSubItemModel(title: 'التقارير', route: AppRoutes.reports),
      SideMenuSubItemModel(
        title: 'ضبط المخزن',
        route: AppRoutes.inventoryAdjustments,
      ),
    ],
  ),
  SideMenuButtonModel(
    title: 'الأصول الثابتة',
    key: 'assets',
    iconPath: AssetsManager.assets,
    route: AppRoutes.assetsGroups,
    subItems: [
      SideMenuSubItemModel(
        title: 'مجموعات الأصول',
        route: AppRoutes.assetsGroups,
      ),
      SideMenuSubItemModel(title: 'سجل الأصول', route: AppRoutes.assetsHistory),
    ],
  ),
  SideMenuButtonModel(
    key: 'suppliers',
    title: 'سجل الموردين',
    iconPath: AssetsManager.supplieres,
    route: AppRoutes.providersAccounts,
    subItems: [
      SideMenuSubItemModel(
        title: 'حسابات الموردين',
        route: AppRoutes.providersAccounts,
      ),
    ],
  ),
  SideMenuButtonModel(
    key: 'clients',
    title: 'سجل العملاء',
    iconPath: AssetsManager.clients,
    route: AppRoutes.clientsAccounts,
    subItems: [
      SideMenuSubItemModel(
        title: 'حسابات العملاء',
        route: AppRoutes.clientsAccounts,
      ),
    ],
  ),
  SideMenuButtonModel(
    key: 'production',
    title: 'متابعة الإنتاج',
    iconPath: AssetsManager.production,
    route: AppRoutes.jobOrdersHistory,
    subItems: [
      SideMenuSubItemModel(
        title: 'سجل أوامر الشغل',
        route: AppRoutes.jobOrdersHistory,
      ),
    ],
  ),
  SideMenuButtonModel(
    key: 'daily',
    title: 'دفتر اليومية',
    iconPath: AssetsManager.daily,
    route: AppRoutes.dailyLog,
  ),
  SideMenuButtonModel(
    key: 'setting',
    title: 'الإعدادات',
    iconPath: AssetsManager.settings,
    route: AppRoutes.settings,
  ),
];
