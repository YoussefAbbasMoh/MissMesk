class EndPoints {
  static const String baseUrl = 'https://miss-misk.vercel.app';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String allAccounts = '/auth/getAllAccounts';
  static const String addAccount = '/auth/addAccount';
  static const String resetPassword = '/auth/updateAccount';
  static const String deleteAccount = '/auth/deleteAccount';

  // Inventory
  static const String addInventory = '/inventory/addInventory';
  static const String getAllInventories = '/inventory';
  static String getInventoryById(String id) => '/inventory/$id';
  static const String addUnit = '/inventory/addItemUnit';
  static const String getStorekeepers = '/inventory/getStorekeepers';
  static const String addStorekeeper = '/inventory/addStorekeeper';
  static String deleteStorekeeper(String storekeeperId) =>
      '/inventory/deleteStorekeeper/$storekeeperId';
  static const String getAllUnits = '/inventory/getItemUnits';
  static String updateInventory(String inventoryId) =>
      '/inventory/updateInventory/$inventoryId';
  static String getProductDetails(String productId) => '/product/$productId';
}
