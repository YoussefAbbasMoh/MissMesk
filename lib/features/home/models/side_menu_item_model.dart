import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';

class SideMenuButtonModel {
  final String title;
  final String iconPath;
  final List<SideMenuSubItemModel>? subItems;
  final String route;

  SideMenuButtonModel({
    required this.title,
    required this.iconPath,
    this.subItems,
    required this.route,
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
    title: 'سجل الموردين',
    iconPath: AssetsManager.supplieres,
    route: AppRoutes.suppliersServices,
    subItems: [
      SideMenuSubItemModel(
        title: 'خدمات الموردين',
        route: AppRoutes.suppliersServices,
      ),
    ],
  ),
  SideMenuButtonModel(
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
    title: 'متابعة الإنتاج',
    iconPath: AssetsManager.production,
    route: AppRoutes.production,
    subItems: [
      SideMenuSubItemModel(
        title: 'متابعة الإنتاج',
        route: AppRoutes.production,
      ),
    ],
  ),
  SideMenuButtonModel(
    title: 'دفتر اليومية',
    iconPath: AssetsManager.daily,
    route: AppRoutes.journal,
  ),
  SideMenuButtonModel(
    title: 'الإعدادات',
    iconPath: AssetsManager.settings,
    route: AppRoutes.settings,
  ),
];
