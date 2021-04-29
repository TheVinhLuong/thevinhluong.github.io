import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumIndicatorWidget extends StatelessWidget {
  final double size;
  final String num;

  const NumIndicatorWidget({
    this.size,
    this.num,
  }) : super();

  @override
  Widget build(BuildContext context) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      width: size,
      height: size,
      child: Text(num));
}
