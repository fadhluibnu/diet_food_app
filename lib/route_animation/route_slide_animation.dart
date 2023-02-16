import 'package:flutter/material.dart';

class RouteSlideAnimation extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  RouteSlideAnimation(
      {required this.child, this.direction = AxisDirection.right})
      : super(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(
      BuildContext context, animation, secondaryAnimation, child) {
    return SlideTransition(
      position:
          Tween(begin: getBeginInstance(), end: Offset.zero).animate(animation),
      child: child,
    );
  }

  Offset getBeginInstance() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
      // default:
    }
  }
}
