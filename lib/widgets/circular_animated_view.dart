import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularAnimatedView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.lightGreenAccent;
    final path = Path()..addArc(Rect.fromCenter(center: Offset(100, 100), width: 50, height: 50), -pi, pi);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}