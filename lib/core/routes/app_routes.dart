/// Legacy route constants - Use AppRouter instead
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Customer routes
  static const String customer = '/customer';
  static const String products = '/customer/products';
  static const String cart = '/customer/cart';
  static const String orders = '/customer/orders';
  static const String profile = '/customer/profile';

  // Admin routes
  static const String admin = '/admin';
  static const String adminProducts = '/admin/products';
  static const String adminOrders = '/admin/orders';
  static const String adminUsers = '/admin/users';

  // Supplier routes
  static const String supplier = '/supplier';
  static const String inventory = '/supplier/inventory';
  static const String supplyOrders = '/supplier/supply-orders';
}
