import 'package:animations/Screens/animated_align_screen.dart';
import 'package:animations/Screens/animated_color_screen.dart';
import 'package:animations/Screens/animated_container_screen.dart';
import 'package:animations/Screens/animated_list_screen.dart';
import 'package:animations/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Screens/animated_physical_model_screen.dart';
import 'Screens/explicit_animations/positioned_transition.dart';
import 'Screens/explicit_animations/rotation_transition_screen.dart';
import 'Screens/explicit_animations/size_transition_screen.dart';

abstract class AppRouter {
  static const animatedListScreen = '/animatedListScreen';
  static const animatedContainerScreen = '/animatedContainerScreen';
  static const animatedColorScreen = '/animatedColorScreen';
  static const animatedAlignScreen = '/animatedAlignScreen';
  static const animatedPhysicalModelScreen = '/animatedPhysicalModelScreen';
  static const positionedTransitionScreen = '/positionedTransitionScreen';
  static const sizeTransitionScreen = '/sizeTransitionScreen';
  static const rotationTransitionScreen = '/rotationTransitionScreen';

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
      GoRoute(
        path: animatedAlignScreen,
        builder: (context, state) => const AnimatedAlignScree(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AnimatedAlignScree(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
      GoRoute(
        path: animatedPhysicalModelScreen,
        builder: (context, state) => const AnimatedPhysicalModelScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AnimatedPhysicalModelScreen(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
      GoRoute(
        path: positionedTransitionScreen,
        builder: (context, state) => const PositionedTransitionScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const PositionedTransitionScreen(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
      GoRoute(
        path: sizeTransitionScreen,
        builder: (context, state) => const SizeTransitionScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SizeTransitionScreen(),
          animationType: AnimationType.sideTransitionFromLtoR,
        ),
      ),
      GoRoute(
        path: rotationTransitionScreen,
        builder: (context, state) => const RotationTransitionScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const RotationTransitionScreen(),
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
