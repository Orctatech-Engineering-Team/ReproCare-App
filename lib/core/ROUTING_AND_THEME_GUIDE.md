# Routing and Theme Guide

This guide explains the routing and theming system for ReproCare.

## 🎨 Theme System

### Files

- **`lib/core/constants/app_colors.dart`** - Color palette for the app
- **`lib/core/theme/app_theme.dart`** - Light and dark theme configurations

### Usage

The app supports both light and dark themes:

```dart
import 'package:reprocare/core/theme/app_theme.dart';

// In your widget
Theme.of(context).colorScheme.primary
```

### Color Palette

#### Primary Colors

- **Primary**: Indigo (#6366F1) - Main brand color
- **Primary Dark**: Darker indigo (#4F46E5)
- **Primary Light**: Lighter indigo (#818CF8)

#### Secondary Colors

- **Secondary**: Teal (#14B8A6)
- **Accent**: Pink (#EC4899)

#### UI Colors

- **Success**: Green (#10B981)
- **Warning**: Orange (#F59E0B)
- **Error**: Red (#EF4444)
- **Info**: Blue (#3B82F6)

## 🚀 Routing System

### Files

- **`lib/core/routes/app_router.dart`** - Main router configuration
- **`lib/core/routes/app_routes.dart`** - Route constants
- **`lib/core/routes/custom_transitions.dart`** - Custom page transitions
- **`lib/core/routes/navigation_helper.dart`** - Helper for easy navigation

### Available Transitions

1. **Fade** - Smooth fade in/out
2. **Slide Right** - Slides in from the right
3. **Slide Up** - Slides up from the bottom
4. **Scale** - Scales from 80% to 100%
5. **Rotate** - Rotation animation
6. **Scale Fade** - Combined scale and fade
7. **Zoom** - Zoom and fade effect

### Navigation Examples

```dart
import 'package:reprocare/core/routes/navigation_helper.dart';

// Navigate using helper
NavigationHelper.toLogin();
NavigationHelper.toProducts();
NavigationHelper.toCart();

// Or using go_router directly
context.go('/customer');
context.push('/products');
context.pop(); // Go back
```

### Route Structure

```
/
├── /login
├── /register
├── /forgot-password
├── /customer
│   ├── /customer/products
│   ├── /customer/cart
│   ├── /customer/orders
│   └── /customer/profile
├── /admin
│   ├── /admin/products
│   ├── /admin/orders
│   └── /admin/users
└── /supplier
    ├── /supplier/inventory
    └── /supplier/supply-orders
```

## 🔐 Authentication Flow

The router includes automatic redirect logic for protected routes:

```dart
// In app_router.dart
redirect: (context, state) {
  final isLoggedIn = false; // Get from your auth state
  final isGoingToLogin = state.matchedLocation == '/login' ||
      state.matchedLocation == '/register';

  if (!isLoggedIn && !isGoingToLogin && state.matchedLocation != '/') {
    return '/login';
  }
  return null;
}
```

## 🎭 Custom Transitions

Each route uses a custom transition for smooth navigation:

```dart
GoRoute(
  path: '/products',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: ProductsScreen(),
    transitionsBuilder: CustomTransitions.slideUp, // Choose your transition
  ),
)
```

## 📱 Usage in Your App

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'ReproCare',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
```

## 🛠️ Next Steps

1. Replace placeholder screens with actual screens
2. Implement authentication logic
3. Add Riverpod providers for state management
4. Connect to your backend API
