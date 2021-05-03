import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TooltipDirection { left, right }

class BubbleWidget extends StatelessWidget {
  final TooltipDirection popupDirection;
  final double arrowBaseWidth;
  final double arrowLength;
  final double arrowTipRadius;
  final double arrowTipDistance;
  final double arrowTipVerticalDistanceFromTop;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Widget child;

  BubbleWidget(
      {this.popupDirection,
      this.arrowBaseWidth,
      this.arrowLength,
      this.arrowTipDistance,
      this.arrowTipRadius,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.arrowTipVerticalDistanceFromTop,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: _BubbleShape(
              popupDirection: popupDirection,
              arrowBaseWidth: arrowBaseWidth,
              arrowLength: arrowLength,
              arrowTipDistance: arrowTipDistance,
              arrowTipRadius: arrowTipRadius,
              borderRadius: borderRadius,
              borderColor: borderColor,
              borderWidth: borderWidth,
              arrowTipVerticalDistanceFromTop:
                  arrowTipVerticalDistanceFromTop)),
      child: child,
    );
  }
}

class _BubbleShape extends ShapeBorder {
  final double arrowBaseWidth;
  final double arrowLength;
  final double arrowTipRadius;
  final double arrowTipDistance;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final TooltipDirection popupDirection;
  final double arrowTipVerticalDistanceFromTop;

  _BubbleShape(
      {this.popupDirection,
      this.borderRadius,
      this.arrowBaseWidth,
      this.arrowTipDistance,
      this.borderColor,
      this.arrowLength,
      this.arrowTipRadius,
      this.borderWidth,
      this.arrowTipVerticalDistanceFromTop});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.fromLTRB(
      borderWidth + borderRadius / 2 + arrowTipDistance,
      borderWidth + borderRadius / 2,
      borderWidth + borderRadius / 2,
      borderWidth + borderRadius / 2);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path _getLeftTopPath(Rect rect) => Path()
      ..moveTo(rect.left + borderWidth / 2 + arrowTipDistance,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop) - arrowBaseWidth / 2 - 1)
      ..lineTo(rect.left + borderWidth / 2 + arrowTipDistance,
          rect.top + borderWidth + borderRadius)
      ..arcToPoint(
          Offset(rect.left + borderWidth + borderRadius + arrowTipDistance,
              rect.top + borderWidth / 2),
          radius: Radius.circular(borderRadius + borderWidth))
      ..lineTo(
          rect.right - borderRadius - borderWidth, rect.top + borderWidth / 2)
      ..arcToPoint(
          Offset(rect.right - borderWidth / 2,
              rect.top + borderRadius + borderWidth),
          radius: Radius.circular(borderRadius + borderWidth),
          clockwise: true)
      ..lineTo(rect.right - borderWidth / 2,
          rect.bottom - borderWidth - borderRadius)
      ..arcToPoint(
          Offset(rect.right - borderWidth - borderRadius,
              rect.bottom - borderWidth / 2),
          radius: Radius.circular(borderRadius + borderWidth))
      ..lineTo(rect.left + borderWidth + borderRadius + arrowTipDistance,
          rect.bottom - borderWidth / 2)
      ..arcToPoint(
          Offset(rect.left + borderWidth / 2 + arrowTipDistance,
              rect.bottom - borderWidth - borderRadius),
          radius: Radius.circular(borderRadius + borderWidth))
      ..lineTo(rect.left + borderWidth / 2 + arrowTipDistance,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop) + arrowBaseWidth / 2)
      ..lineTo(rect.left + borderWidth / 2,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop))
      ..quadraticBezierTo(
          rect.left + borderWidth / 2,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop),
          rect.left + borderWidth / 2 + arrowTipDistance,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop) - arrowBaseWidth / 2)
      ..lineTo(rect.left + borderWidth / 2 + arrowTipDistance,
          rect.bottom - (rect.height - arrowTipVerticalDistanceFromTop) - arrowBaseWidth / 2 - 1);

    Path _getBottomRightPath(Rect rect) => Path()
      ..moveTo(rect.left + borderRadius, rect.bottom)
      ..lineTo(rect.right - borderRadius, rect.bottom)
      ..arcToPoint(Offset(rect.right, rect.bottom - borderRadius),
          radius: Radius.circular(borderRadius), clockwise: false)
      ..lineTo(rect.right, rect.top + borderRadius)
      ..arcToPoint(Offset(rect.right - borderRadius, rect.top),
          radius: Radius.circular(borderRadius), clockwise: false);

    switch (popupDirection) {
      case TooltipDirection.left:
        return _getLeftTopPath(rect);
      case TooltipDirection.right:
        return _getBottomRightPath(rect);

      default:
        throw AssertionError(popupDirection);
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    var paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => _BubbleShape(
      popupDirection: popupDirection,
      borderRadius: borderRadius,
      arrowBaseWidth: arrowBaseWidth,
      arrowTipDistance: arrowTipDistance,
      borderColor: borderColor,
      borderWidth: borderWidth,
      arrowLength: arrowLength,
      arrowTipRadius: arrowTipRadius);
}
