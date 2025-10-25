import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view/onboarding_screen.dart';
import '../../features/auth/view/splash_screen.dart';
import 'custom_transitions.dart';

/// Application router configuration
class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionsBuilder: CustomTransitions.fade,
        ),
      ),
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: CustomTransitions.fade,
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _buildPlaceholder('Login Screen'),
          transitionsBuilder: CustomTransitions.fade,
        ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: CustomTransitions.slideUp,
        ),
      ),
      GoRoute(
        path: '/forgot-password',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _buildPlaceholder('Forgot Password Screen'),
          transitionsBuilder: CustomTransitions.fade,
        ),
      ),
      // Customer Routes
      GoRoute(
        path: '/customer',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _buildPlaceholder('Customer Dashboard'),
          transitionsBuilder: CustomTransitions.slideRight,
        ),
        routes: [
          GoRoute(
            path: 'products',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Products List'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
          GoRoute(
            path: 'cart',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Shopping Cart'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
          GoRoute(
            path: 'orders',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('My Orders'),
              transitionsBuilder: CustomTransitions.fade,
            ),
          ),
          GoRoute(
            path: 'profile',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Profile'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
        ],
      ),
      // Admin Routes
      GoRoute(
        path: '/admin',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _buildPlaceholder('Admin Dashboard'),
          transitionsBuilder: CustomTransitions.slideRight,
        ),
        routes: [
          GoRoute(
            path: 'products',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Manage Products'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
          GoRoute(
            path: 'orders',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Manage Orders'),
              transitionsBuilder: CustomTransitions.fade,
            ),
          ),
          GoRoute(
            path: 'users',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Manage Users'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
        ],
      ),
      // Supplier Routes
      GoRoute(
        path: '/supplier',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _buildPlaceholder('Supplier Dashboard'),
          transitionsBuilder: CustomTransitions.slideRight,
        ),
        routes: [
          GoRoute(
            path: 'inventory',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Inventory Management'),
              transitionsBuilder: CustomTransitions.slideUp,
            ),
          ),
          GoRoute(
            path: 'supply-orders',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: _buildPlaceholder('Supply Orders'),
              transitionsBuilder: CustomTransitions.fade,
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.error.toString(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
    redirect: (context, state) {
      // Add authentication logic here
      final isLoggedIn = false; // Get from your auth state
      final isGoingToLogin =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      // If not logged in and trying to access protected routes, redirect to login
      if (!isLoggedIn && !isGoingToLogin && state.matchedLocation != '/') {
        return '/login';
      }

      return null;
    },
  );

  static Widget _buildPlaceholder(String title) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming Soon',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom page that supports custom transitions
class CustomTransitionPage extends Page<void> {
  final Widget child;
  final Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  transitionsBuilder;

  const CustomTransitionPage({
    required this.child,
    required this.transitionsBuilder,
    super.key,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: transitionsBuilder,
    );
  }
}
