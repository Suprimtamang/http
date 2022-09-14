import 'package:flutter/material.dart';

class BottomToUp extends PageRoute {
  final Widget targetChild;
  BottomToUp(this.targetChild);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return targetChild;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 4000);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final fadeTween = Tween(begin: 0.0, end: 1.0);

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: targetChild,
    );
  }
}

Route fadeRoute(Widget targetchild) {
  return PageRouteBuilder(
      pageBuilder: (ctx, _, __) => targetchild,
      transitionDuration: Duration(milliseconds: 400),
      reverseTransitionDuration: Duration(milliseconds: 400),
      barrierColor: Colors.transparent,
      transitionsBuilder: (ctx, animation, _, ch) {
        final fadeTween = Tween(begin: 0.0, end: 1.0);

        return FadeTransition(
          opacity: animation.drive(fadeTween),
          child: targetchild,
        );
      });
}
