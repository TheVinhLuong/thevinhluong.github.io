import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularAnimatedView extends CustomPainter {
  double sweepAngle;
  double strokeWidth = 30;

  @override
  void paint(Canvas canvas, Size size) {
    sweepAngle = pi * 1 / 3;
    final paint = Paint()..color = Colors.lightGreenAccent;
    final outerArc = Path()..moveTo(10, size.height)
    ..quadraticBezierTo(0,0, 10,10)
      // ..addArc(
      //     Rect.fromCenter(
      //         center: Offset(size.width / 2, size.height),
      //         width: size.width,
      //         height: size.height),
      //     -pi,
      //     pi)
      // ..lineTo(0 + size.width / 2, size.height)
    ;
    final innerArc = Path()
      ..addArc(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height),
              width: size.width - strokeWidth,
              height: size.height - strokeWidth),
          -pi,
          pi);

    final sweeperArc = Path()
      ..addArc(
          Rect.fromCenter(
              center: Offset(size.width/2, size.height),
              width: size.width,
              height: size.height),
          -pi,
          sweepAngle)..lineTo(size.width/2, size.height);
    //
    canvas.drawPath(
        Path.combine(
            PathOperation.intersect,
            Path.combine(PathOperation.difference, outerArc, innerArc),
            sweeperArc),
        paint);
    // canvas.drawPath(sweeperArc, paint);

    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.blue[800]),
        text: "${(sweepAngle / pi * 100).round()}");
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(5.0, 5.0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  CircularAnimatedView(this.sweepAngle);
}
