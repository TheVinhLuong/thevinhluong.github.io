import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularAnimatedView extends CustomPainter {
  double sweepAngle;
  double circularBreadth = 30;
  double radius;
  double diameter;
  double lineStrokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    radius = size.width / 2;
    diameter = radius * 2;
    // sweepAngle = pi * 1 / 3;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = lineStrokeWidth
      ..shader = RadialGradient(
        colors: [
          Colors.red,
          Colors.green,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(100, 100),
        radius: radius,
      ));
    final nubArc = Path()
      ..moveTo(0, diameter - circularBreadth / 2)
      ..arcToPoint(Offset(0 + circularBreadth, diameter - circularBreadth / 2),
          radius: Radius.circular(circularBreadth / 2), clockwise: false)
      ..relativeArcToPoint(
          Offset(
              (diameter - circularBreadth * 2) / 2 -
                  (radius - circularBreadth) * cos(sweepAngle),
              -(radius - circularBreadth) * sin(sweepAngle)),
          radius: Radius.circular(radius - circularBreadth),
          clockwise: true)
      ..relativeArcToPoint(
          -Offset(cos(sweepAngle) * circularBreadth,
              sin(sweepAngle) * circularBreadth),
          radius: Radius.circular(circularBreadth / 2),
          clockwise: false)
      ..relativeArcToPoint(
          Offset(
              -(radius - cos(sweepAngle) * radius), sin(sweepAngle) * radius),
          radius: Radius.circular(radius),
          clockwise: false);
    canvas.drawPath(nubArc, paint);

    TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.blue[800]),
        text: "${(sweepAngle / pi * 100).round()}");
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(radius - tp.width / 2, diameter - tp.height));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  CircularAnimatedView(this.sweepAngle);
}
