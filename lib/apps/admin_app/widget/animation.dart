import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage slideNav(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, second, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0), // Starts off-screen to the right
          end: Offset.zero, // Ends at the center
        ).animate(animation),
        child: child,
      );
    },
  );
}
