class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';

  static const String inventory = '/inventory';
  static String itemCard(String id) => '$itemCardBase/$id';
  static const String itemCardBase = '/inventory/itemcard';
  static const String inventoryRecords = '/inventory/inventoryrecords';
  static const String reports = '/inventory/reports';
  static const String inventoryAdjustments = '/inventory/inventoryadjustments';
  static const String inventoryTransactions =
      '$itemCardBase/inventorytransactions';
  static const String newInventoryProcess = '/inventory/newInventoryProcess';
  static const String inventoryDetails = '/inventory/inventorydetails';

  static const String assetsGroups = '/assetsgroups';
  static const String assetsHistory = '/assetsgroups/assetshistory';

  static const String providersAccounts = '/providersaccounts';
  static const String providerDetails = '/providersaccounts/providerdetails';
  static const String providerAccountStatement =
      '/providersaccounts/providerdetails/provideraccountstatement';

  static const String clientsAccounts = '/clientsaccounts';

  static const String production = '/production';
  static const String dailyLog = '/dailyLog';
  static const String settings = '/settings';
}

final Map<String, String> arabicBreadcrumbTitles = {
  AppRoutes.home: 'الرئيسية',
  AppRoutes.login: 'تسجيل الدخول',
  AppRoutes.inventory: 'إدارة المخزون والمنتجات',
  AppRoutes.inventoryRecords: 'سجلات الجرد',
  AppRoutes.reports: 'التقارير',
  AppRoutes.inventoryAdjustments: 'إعدادات المخازن',
  AppRoutes.assetsGroups: 'الأصول الثابتة',
  AppRoutes.assetsHistory: 'سجل الأصول',
  AppRoutes.providersAccounts: 'حسابات الموردين',
  AppRoutes.clientsAccounts: 'حسابات العملاء',
  AppRoutes.production: 'متابعة الإنتاج',
  AppRoutes.dailyLog: 'دفتر اليومية',
  AppRoutes.settings: 'الإعدادات',
  AppRoutes.itemCardBase: 'بطاقة مخزون صنف',
  AppRoutes.inventoryTransactions: 'سجل الحركات المخزنية',
  AppRoutes.newInventoryProcess: 'عملية جرد جديدة',
  AppRoutes.inventoryDetails: 'تفاصيل الجرد',
  AppRoutes.providerDetails: 'تفاصيل المورد',
  AppRoutes.providerAccountStatement: 'كشف حساب المورد',
};
