import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/misc/test_style.dart';

class TimeRangeWidget extends StatelessWidget {
  final int yearStart;
  final int yearEnd;

  const TimeRangeWidget(
      {Key key, @required this.yearStart, this.yearEnd = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
      decoration: BoxDecoration(
          color: Color(0xFF03CC85),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        yearEnd != 0 ?
        "$yearStart-$yearEnd" : "$yearStart",
        style: primaryTextStyle.copyWith(
            fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white),
      ),
    );
  }
}
