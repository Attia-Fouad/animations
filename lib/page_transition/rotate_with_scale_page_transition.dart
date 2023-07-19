import 'package:flutter/material.dart';

class PageRotateWithScaleTransition extends PageRouteBuilder {
  final dynamic page;

  PageRotateWithScaleTransition(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // end =1; its number of turns
              var rotateAnimation = Tween<double>(begin: 0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.linear));
              var scaleAnimation = Tween<double>(begin: 0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.linear));
              return ScaleTransition(
                alignment: Alignment.center,
                scale: scaleAnimation,
                child: RotationTransition(
                  turns: rotateAnimation,
                  child: child,
                ),
              );
            });
}
