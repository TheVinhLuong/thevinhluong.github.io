import 'package:flutter/material.dart';
import 'package:portfolio/misc/test_style.dart';
import 'package:portfolio/widgets/bubble_widget.dart';

class EmploymentBubbleWidget extends StatelessWidget {
  const EmploymentBubbleWidget(
      {Key key,
      @required this.indicatorSize,
      @required this.arrowTipVerticalDistanceFromTop,
      this.workPosition = '',
      this.firmName = '',
      this.description = ''})
      : super(key: key);

  final double indicatorSize;
  final double arrowTipVerticalDistanceFromTop;
  final String workPosition;
  final String firmName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: BubbleWidget(
          popupDirection: TooltipDirection.left,
          arrowBaseWidth: 20,
          arrowLength: 1,
          arrowTipVerticalDistanceFromTop:
              indicatorSize / 2 + arrowTipVerticalDistanceFromTop,
          arrowTipDistance: 14,
          arrowTipRadius: 1,
          borderRadius: 5,
          borderColor: Color(0xFFd6d6d6),
          borderWidth: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '$workPosition',
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      firmName.isNotEmpty ? TextSpan(
                          text: ' - $firmName',
                          style: primaryTextStyle.copyWith(
                              fontStyle: FontStyle.italic, fontSize: 16)) : TextSpan(),
                    ],
                  ),
                ),
                description.isNotEmpty ? 
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    description,
                    style: primaryTextStyle.copyWith(
                        fontSize: 17, color: Colors.grey.shade700),
                    textAlign: TextAlign.start,
                  ),
                ) : SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}
