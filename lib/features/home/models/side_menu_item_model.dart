import 'package:miss_misq/core/routing/routes.dart';
import 'package:miss_misq/core/utils/assets_manager.dart';

class SideMenuButtonModel {
  final String title;
  final String iconPath;
  final List<SideMenuSubItemModel> subItems;

  SideMenuButtonModel({
    required this.title,
    required this.iconPath,
    required this.subItems,
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
    subItems: [],
  ),

  SideMenuButtonModel(
    title: 'إدارة المخزون والمنتجات',
    iconPath: AssetsManager.management,
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
    subItems: [],
  ),
  SideMenuButtonModel(
    title: 'الإعدادات',
    iconPath: AssetsManager.settings,
    subItems: [],
  ),
];
