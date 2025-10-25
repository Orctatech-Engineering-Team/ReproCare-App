import 'package:go_router/go_router.dart';

import 'app_router.dart';
import 'app_routes.dart';

/// Helper class for easy navigation throughout the app
class NavigationHelper {
  /// Navigate to splash screen
  static void toSplash() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.splash);

  /// Navigate to onboarding screen
  static void toOnboarding() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.onboarding);

  /// Navigate to login screen
  static void toLogin() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.login);

  /// Navigate to register screen
  static void toRegister() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.register);

  /// Navigate to forgot password screen
  static void toForgotPassword() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.forgotPassword);

  /// Navigate to customer dashboard
  static void toCustomerDashboard() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.customer);

  /// Navigate to products list
  static void toProducts() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.products);

  /// Navigate to shopping cart
  static void toCart() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.cart);

  /// Navigate to orders
  static void toOrders() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.orders);

  /// Navigate to profile
  static void toProfile() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.profile);

  /// Navigate to admin dashboard
  static void toAdminDashboard() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.admin);

  /// Navigate to admin products
  static void toAdminProducts() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.adminProducts);

  /// Navigate to admin orders
  static void toAdminOrders() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.adminOrders);

  /// Navigate to supplier dashboard
  static void toSupplierDashboard() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.supplier);

  /// Navigate to inventory management
  static void toInventory() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.inventory);

  /// Navigate to supply orders
  static void toSupplyOrders() =>
      AppRouter.navigatorKey.currentContext?.go(AppRoutes.supplyOrders);

  /// Navigate back
  static void back() => AppRouter.navigatorKey.currentContext?.pop();

  /// Navigate to a custom path
  static void to(String path) =>
      AppRouter.navigatorKey.currentContext?.go(path);

  /// Push a new route (maintains navigation stack)
  static void push(String path) =>
      AppRouter.navigatorKey.currentContext?.push(path);

  /// Get current route
  static String? getCurrentRoute() {
    final context = AppRouter.navigatorKey.currentContext;
    if (context != null) {
      final router = GoRouter.of(context);
      return router.routerDelegate.currentConfiguration.last.matchedLocation;
    }
    return null;
  }
}
