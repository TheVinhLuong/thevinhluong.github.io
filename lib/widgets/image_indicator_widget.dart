import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageIndicatorWidget extends StatelessWidget {
  final double size;
  final String imageSrc;
  final double imagePadding;

  const ImageIndicatorWidget({
    this.size,
    this.imageSrc,
    this.imagePadding = 0
  }) : super();

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(imagePadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      width: size,
      height: size,
      child: Image.asset(imageSrc));
}
