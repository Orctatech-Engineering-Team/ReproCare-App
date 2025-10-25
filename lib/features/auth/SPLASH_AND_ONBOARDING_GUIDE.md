# Splash Screen & Onboarding Guide

## 📱 Overview

This guide describes the splash screen and onboarding flow for ReproCare.

## ✨ Features

### Splash Screen (`splash_screen.dart`)

- Beautiful animated gradient background
- App logo with elevation shadow
- Smooth fade and scale animations
- Auto-navigation to onboarding after 3 seconds
- Loading indicator

### Onboarding Screen (`onboarding_screen.dart`)

- **4 Informative Pages**:
  1. **Browse Products** - Explore contraceptive products
  2. **Privacy First** - Security and anonymity
  3. **Fast Delivery** - Quick shipping
  4. **Expert Support** - Healthcare guidance
- Interactive page indicators
- Skip button at the top
- Previous/Next navigation buttons
- Auto-navigates to login after completion

## 🎨 Design Elements

### Splash Screen

```dart
- Gradient: Primary → Secondary color
- Icon: Health & Safety icon in circular badge
- Animation: Fade + Scale effect
- Duration: 3 seconds before auto-navigation
```

### Onboarding Screen

```dart
- Page indicators: Animated dots
- Icons: Each page has a unique colored icon
- Colors: Blue, Purple, Green, Orange
- Navigation: Smooth page transitions
- Skip: Available on all pages
```

## 🛣️ Navigation Flow

```
Splash Screen (3 sec)
    ↓
Onboarding Screen
    ↓
Login/Register Screen
```

## 📝 Usage

### Update Splash Screen Navigation Logic

In `splash_screen.dart`, you can customize the navigation logic:

```dart
void _navigateToNextScreen() {
  Future.delayed(const Duration(seconds: 3), () {
    if (mounted) {
      // Check if user has seen onboarding
      final hasSeenOnboarding = false; // Get from SharedPreferences
      
      if (hasSeenOnboarding) {
        context.go(AppRoutes.login);
      } else {
        context.go('/onboarding');
      }
    }
  });
}
```

### Update Onboarding Completion

In `onboarding_screen.dart`, customize what happens after onboarding:

```dart
void _goToLogin() {
  // Save onboarding status to SharedPreferences
  // SharedPreferences.setBool('has_seen_onboarding', true);
  
  context.go(AppRoutes.login);
}
```

## 🎯 Customization

### Add More Onboarding Pages

Edit the `_pages` list in `onboarding_screen.dart`:

```dart
final List<OnboardingPage> _pages = [
  OnboardingPage(
    icon: Icons.your_icon,
    title: 'Your Title',
    description: 'Your description here.',
    color: Colors.yourColor,
  ),
  // Add more pages...
];
```

### Change Splash Screen Logo

In `splash_screen.dart`:

```dart
Icon(
  Icons.your_custom_icon,
  size: 80,
  color: theme.colorScheme.primary,
)
```

### Adjust Animation Duration

```dart
// In splash_screen.dart
AnimationController(
  vsync: this,
  duration: const Duration(seconds: 2), // Change duration
)
```

## 🔄 Navigation Routes

Available routes:

- `/` - Splash Screen
- `/onboarding` - Onboarding Screen
- `/login` - Login Screen (to be implemented)
- `/register` - Registration Screen (currently shows onboarding)

## 📦 Files Structure

```
lib/features/auth/view/
├── splash_screen.dart
├── onboarding_screen.dart
└── SPLASH_AND_ONBOARDING_GUIDE.md
```

## 🚀 Next Steps

1. Implement login/register screens
2. Add SharedPreferences to remember onboarding status
3. Add user authentication logic
4. Connect to backend API
5. Add analytics tracking for onboarding
