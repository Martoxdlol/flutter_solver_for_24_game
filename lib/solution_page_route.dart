import 'package:flutter/material.dart';

class SolutionPageRoute extends PageRoute {
  SolutionPageRoute({required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Close';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double maxHeigth = height - 20;

    if (maxHeigth > 800) maxHeigth = 800;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width > 620 ? 20 : 0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
            maxHeight: width > 620 ? maxHeigth : double.infinity,
          ),
          child: builder(context),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 180);
}
