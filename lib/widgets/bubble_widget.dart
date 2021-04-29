import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TooltipDirection { left, right }

class BubbleWidget extends StatelessWidget {
  final TooltipDirection popupDirection;
  final double arrowBaseWidth;
  final double arrowLength;
  final double arrowTipRadius;
  final double arrowTipDistance;
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
              borderWidth: borderWidth)),
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
  final double tipWidth = 8;
  final double tipHeight = 10;

  _BubbleShape(
      {this.popupDirection,
      this.borderRadius,
      this.arrowBaseWidth,
      this.arrowTipDistance,
      this.borderColor,
      this.arrowLength,
      this.arrowTipRadius,
      this.borderWidth});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.fromLTRB(
      borderWidth + borderRadius / 2 + tipHeight,
      borderWidth + borderRadius / 2,
      borderWidth + borderRadius / 2,
      borderWidth + borderRadius / 2);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path _getLeftTopPath(Rect rect) => Path()
      ..moveTo(rect.left + borderWidth / 2 + tipHeight,
          rect.bottom - rect.height / 2 - tipWidth / 2 - 1)
      ..lineTo(rect.left + borderWidth / 2 + tipHeight,
          rect.top + borderWidth + borderRadius)
      ..arcToPoint(
          Offset(rect.left + borderWidth + borderRadius + tipHeight,
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
      ..lineTo(rect.left + borderWidth + borderRadius + tipHeight,
          rect.bottom - borderWidth / 2)
      ..arcToPoint(
          Offset(rect.left + borderWidth / 2 + tipHeight,
              rect.bottom - borderWidth - borderRadius),
          radius: Radius.circular(borderRadius + borderWidth))
      ..lineTo(rect.left + borderWidth / 2 + tipHeight,
          rect.bottom - rect.height / 2 + tipWidth / 2)
      ..lineTo(rect.left + borderWidth / 2, rect.bottom - rect.height / 2)
      ..quadraticBezierTo(
          rect.left + borderWidth / 2,
          rect.bottom - rect.height / 2,
          rect.left + borderWidth / 2 + tipHeight,
          rect.bottom - rect.height / 2 - tipWidth / 2)
      ..lineTo(rect.left + borderWidth / 2 + tipHeight,
          rect.bottom - rect.height / 2 - tipWidth / 2 - 1);
    // ..lineTo(rect.left + borderWidth / 2 + tipHeight+borderWidth/2, rect.bottom - rect.height/2 - tipWidth/2);
    // ..relativeLineTo(
    //     0, -(rect.height / 2 - borderWidth - borderRadius - tipWidth / 2))
    // ..relativeLineTo(-tipHeight, -tipWidth / 2)
    // ..relativeLineTo(tipHeight, -tipWidth / 2);

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
      // ..lineTo(rect.right-borderRadius/2, rect.bottom - borderRadius/2);
      // ..arcToPoint(Offset(rect.right - borderRadius/2, rect.bottom - borderRadius/2),
      //     radius: Radius.circular(borderRadius))
      // ..lineTo(rect.left + borderRadius/2, rect.bottom-borderRadius/2)
      // ..arcToPoint(Offset(rect.left + borderRadius/2, rect.bottom - borderRadius),
      //     radius: Radius.circular(borderRadius));
      // ..arcToPoint(Offset(borderRadius, rect.bottom - borderRadius));
      //   ..quadraticBezierTo(
      //       targetCenter.dx - arrowTipDistance,
      //       targetCenter.dy,
      //       targetCenter.dx -
      //           arrowTipDistance -
      //           arrowTipRadius / (arrowBaseWidth / 2) * arrowLength,
      //       targetCenter.dy +
      //           (arrowBaseWidth / 2 - (arrowBaseWidth / 2 - arrowTipRadius)))
      //   //  left /
      //   ..lineTo(
      //       rect.right,
      //       min(targetCenter.dy + arrowBaseWidth / 2,
      //           rect.bottom - borderRadius))
      //   ..lineTo(rect.right, rect.bottom - borderRadius)
      //   ..arcToPoint(Offset(rect.right - borderRadius, rect.bottom),
      //       radius: Radius.circular(borderRadius), clockwise: true)
      //   ..lineTo(rect.left + borderRadius, rect.bottom)
      //   ..arcToPoint(Offset(rect.left, rect.bottom - borderRadius),
      //       radius: Radius.circular(borderRadius), clockwise: true);
      case TooltipDirection.right:
        return _getBottomRightPath(rect);
      //   ..lineTo(rect.left + borderRadius, rect.top)
      //   ..arcToPoint(Offset(rect.left, rect.top + borderRadius),
      //       radius: Radius.circular(borderRadius), clockwise: false)
      //   ..lineTo(
      //       rect.left,
      //       max(
      //           min(targetCenter.dy - arrowBaseWidth / 2,
      //               rect.bottom - borderRadius - arrowBaseWidth),
      //           rect.top + borderRadius))
      //   //left to arrow tip   /
      //   ..lineTo(
      //       targetCenter.dx +
      //           arrowTipDistance +
      //           arrowTipRadius / (arrowBaseWidth / 2) * arrowLength,
      //       targetCenter.dy -
      //           (arrowBaseWidth / 2 - (arrowBaseWidth / 2 - arrowTipRadius)))
      //   ..quadraticBezierTo(
      //       targetCenter.dx + arrowTipDistance,
      //       targetCenter.dy,
      //       targetCenter.dx +
      //           arrowTipDistance +
      //           arrowTipRadius / (arrowBaseWidth / 2) * arrowLength,
      //       targetCenter.dy +
      //           (arrowBaseWidth / 2 - (arrowBaseWidth / 2 - arrowTipRadius)))
      //   //  right
      //   ..lineTo(
      //       rect.left,
      //       min(targetCenter.dy + arrowBaseWidth / 2,
      //           rect.bottom - borderRadius))
      //   ..lineTo(rect.left, rect.bottom - borderRadius)
      //   ..arcToPoint(Offset(rect.left + borderRadius, rect.bottom),
      //       radius: Radius.circular(borderRadius), clockwise: false);

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

    // canvas.drawPath(getOuterPath(rect), paint);
    // paint = Paint()
    //   ..color = Colors.blue
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = borderWidth;
    //
    // canvas.drawPath(
    //     Path()
    //       ..moveTo(rect.right, rect.top)
    //       ..lineTo(rect.right, rect.bottom),
    //     paint);
    // canvas.drawPath(
    //     Path()
    //       ..moveTo(rect.left, rect.top)
    //       ..lineTo(rect.left, rect.bottom),
    //     paint);
    // canvas.drawPath(
    //     Path()
    //       ..moveTo(rect.right, rect.top)
    //       ..lineTo(rect.left, rect.top),
    //     paint);
    // canvas.drawPath(
    //     Path()
    //       ..moveTo(rect.right, rect.bottom)
    //       ..lineTo(rect.left, rect.bottom),
    //     paint);
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
