import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:portfolio/widgets/circular_animated_view.dart';

class CircularIndicatorWidget extends StatefulWidget {
  final double width;
  final double height;

  CircularIndicatorWidget(this.width, this.height);

  @override
  _CircularIndicatorWidgetState createState() =>
      _CircularIndicatorWidgetState();
}

class _CircularIndicatorWidgetState extends State<CircularIndicatorWidget>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween<double> _growingTween = Tween(begin: 0, end: pi / 3);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = _growingTween.animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: CircularAnimatedView(animation.value),
      ),
    );
  }
}
