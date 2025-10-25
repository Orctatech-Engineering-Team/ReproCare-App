import 'package:flutter/material.dart';

/// Custom page transitions for the app
class CustomTransitions {
  /// Fade transition
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  fade = (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation.drive(
        Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: child,
    );
  };

  /// Slide transition from right
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  slideRight = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOutCubic)),
      ),
      child: child,
    );
  };

  /// Slide transition from bottom
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  slideUp = (context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)),
      ),
      child: child,
    );
  };

  /// Scale transition
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  scale = (context, animation, secondaryAnimation, child) {
    return ScaleTransition(
      scale: animation.drive(
        Tween(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  };

  /// Rotation transition
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  rotate = (context, animation, secondaryAnimation, child) {
    return RotationTransition(
      turns: animation.drive(
        Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  };

  /// Combined scale and fade transition
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  scaleFade = (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation.drive(
          Tween(
            begin: 0.9,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOutCubic)),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  };

  /// Zoom transition
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  zoom = (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..scale(1.0 - animation.value * 0.2)
          ..translate(animation.value * 50, animation.value * 50),
        child: child,
      ),
    );
  };
}
