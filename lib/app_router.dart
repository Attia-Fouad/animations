import 'package:animations/Screens/animated_color_screen.dart';
import 'package:animations/Screens/animated_container_screen.dart';
import 'package:animations/Screens/animated_list_screen.dart';
import 'package:animations/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const animatedListScreen = '/animatedListScreen';
  static const animatedContainerScreen = '/animatedContainerScreen';
  static const animatedColorScreen = '/animatedColorScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
          animationType: AnimationType.fadeTransitionAnimation,
        ),
      ),
      GoRoute(
        path: animatedListScreen,
        builder: (context, state) => const AnimatedListScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AnimatedListScreen(),
          animationType: AnimationType.sideTransitionFromRtoL,
        ),
      ),
      GoRoute(
        path: animatedContainerScreen,
        builder: (context, state) => const AnimatedContainerScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AnimatedContainerScreen(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
      GoRoute(
        path: animatedColorScreen,
        builder: (context, state) => const AnimatedColorScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AnimatedColorScreen(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
    ],
  );
}

enum AnimationType {
  fadeTransitionAnimation,
  sideTransitionFromDownToUp,
  sideTransitionFromLtoR,
  sideTransitionFromRtoL,
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required AnimationType animationType,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (animationType) {
          case AnimationType.fadeTransitionAnimation:
            return fadeTransition(animation: animation, child: child);
          case AnimationType.sideTransitionFromDownToUp:
            return sideTransitionFromDownToUp(
                animation: animation, child: child);
          case AnimationType.sideTransitionFromLtoR:
            return sideTransitionFromLtoR(child: child, animation: animation);
          case AnimationType.sideTransitionFromRtoL:
            return sideTransitionFromRtoL(child: child, animation: animation);
        }
      });
}

FadeTransition fadeTransition({required animation, required child}) =>
    FadeTransition(opacity: animation, child: child);

SlideTransition sideTransitionFromDownToUp(
        {required animation, required child}) =>
    SlideTransition(
        position: animation.drive(Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        )),
        child: child);

SlideTransition sideTransitionFromLtoR({required animation, required child}) =>
    SlideTransition(
        position: animation.drive(Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        )),
        child: child);

SlideTransition sideTransitionFromRtoL({required animation, required child}) =>
    SlideTransition(
        position: animation.drive(Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        )),
        child: child);
