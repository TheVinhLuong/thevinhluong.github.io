import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget(
      {@required this.children,
      this.indicators,
      this.isLeftAligned = true,
      this.gutterSpacing = 4.0,
      this.controller,
      this.lineColor = Colors.grey,
      this.physics,
      this.shrinkWrap = true,
      this.primary = false,
      this.reverse = false,
      this.indicatorSize = 30.0,
      this.lineGap = 0,
      this.indicatorStyle = PaintingStyle.fill,
      this.strokeCap = StrokeCap.butt,
      this.strokeWidth = 1.0,
      this.style = PaintingStyle.stroke,
      this.indicatorPaddingTop = 0})
      : itemCount = children.length,
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  final List<Widget> children;
  final double gutterSpacing;
  final List<Widget> indicators;
  final bool isLeftAligned;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final double indicatorPaddingTop;

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: physics,
        separatorBuilder: (_, __) => SizedBox.shrink(),
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        controller: controller,
        reverse: reverse,
        primary: primary,
        itemBuilder: (context, index) {
          final child = children[index];

          Widget indicator;
          if (indicators != null) {
            indicator = indicators[index];
          }

          final isFirst = index == 0;
          final isLast = index == itemCount - 1;

          final timelineTile = <Widget>[
            Material(
              color: Colors.white,
              child: CustomPaint(
                foregroundPainter: _TimelinePainter(
                  hideDefaultIndicator: indicator != null,
                  lineColor: lineColor,
                  indicatorSize: indicatorSize,
                  indicatorPaddingTop: indicatorPaddingTop,
                  indicatorStyle: indicatorStyle,
                  isFirst: isFirst,
                  isLast: isLast,
                  lineGap: lineGap,
                  strokeCap: strokeCap,
                  strokeWidth: strokeWidth,
                  style: style,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: indicatorPaddingTop),
                  height: double.infinity,
                  width: indicatorSize,
                  child: indicator,
                ),
              ),
            ),
            SizedBox(width: gutterSpacing),
            Expanded(child: Material(child: child, color: Colors.white,)),
          ];

          return IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
            ),
          );
        },
      );
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter(
      {@required this.hideDefaultIndicator,
      @required this.indicatorStyle,
      @required this.indicatorSize,
      @required this.lineGap,
      @required this.strokeCap,
      @required this.strokeWidth,
      @required this.style,
      @required this.lineColor,
      @required this.isFirst,
      @required this.isLast,
      @required this.indicatorPaddingTop})
      : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style;

  final bool hideDefaultIndicator;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double indicatorPaddingTop;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final bool isFirst;
  final bool isLast;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;

    final top = size.topLeft(Offset(indicatorRadius, 0));
    final centerTop = size.topLeft(
      Offset(indicatorRadius, () {
        if (indicatorPaddingTop > lineGap) {
          return indicatorPaddingTop - lineGap;
        } else {
          return 0.0;
        }
      }()),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, () {
      if (indicatorPaddingTop >= lineGap) {
        return 0.0;
      } else {
        return indicatorPaddingTop - lineGap;
      }
    }()));
    final centerBottom = size.topLeft(
      Offset(indicatorRadius, indicatorSize + indicatorPaddingTop + lineGap),
    );

    if (!isFirst) {
      canvas.drawLine(top, centerTop, linePaint);
    }
    if (!isLast) {
      canvas.drawLine(centerBottom, bottom, linePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
