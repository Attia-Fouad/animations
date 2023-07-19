import 'package:flutter/material.dart';

class PageFadeWithSizeTransition extends PageRouteBuilder {
  final dynamic page;

  PageFadeWithSizeTransition(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return Align(
                alignment: Alignment.center,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  child: FadeTransition(opacity: animation, child: child),
                ),
              );
            });
}
