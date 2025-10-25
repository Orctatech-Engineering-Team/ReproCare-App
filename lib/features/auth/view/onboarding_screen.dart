import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      icon: Icons.shopping_bag_rounded,
      title: 'Browse Products',
      description:
          'Explore our wide range of contraceptive products with detailed information and reviews.',
      color: Colors.blue,
    ),
    OnboardingPage(
      icon: Icons.privacy_tip_rounded,
      title: 'Privacy First',
      description:
          'Your health data is encrypted and secure. Shop with confidence and complete anonymity.',
      color: Colors.purple,
    ),
    OnboardingPage(
      icon: Icons.local_shipping_rounded,
      title: 'Fast Delivery',
      description:
          'Get your products delivered discreetly to your doorstep with fast and reliable shipping.',
      color: Colors.green,
    ),
    OnboardingPage(
      icon: Icons.support_agent_rounded,
      title: 'Expert Support',
      description:
          'Get professional guidance from our healthcare experts whenever you need help.',
      color: Colors.orange,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    context.go(AppRoutes.login);
  }

  void _skip() {
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) =>
                    _buildPage(_pages[index], theme),
              ),
            ),

            // Page Indicators
            _buildPageIndicators(theme),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton.icon(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 16),
                      label: const Text('Previous'),
                    )
                  else
                    const SizedBox(width: 1),

                  ElevatedButton.icon(
                    onPressed: _nextPage,
                    icon: Icon(
                      _currentPage == _pages.length - 1
                          ? Icons.check_rounded
                          : Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    label: Text(
                      _currentPage == _pages.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: page.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(page.icon, size: 60, color: page.color),
          ),
          const SizedBox(height: 48),

          // Title
          Text(
            page.title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            page.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicators(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
