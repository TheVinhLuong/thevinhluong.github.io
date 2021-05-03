import 'package:flutter/material.dart';
import 'package:portfolio/misc/test_style.dart';
import 'package:portfolio/widgets/time_range_widget.dart';

import '../../../widgets/bubble_widget.dart';
import '../../../widgets/image_indicator_widget.dart';
import '../../../widgets/stepper_widget.dart';
import 'employment_bubble_widget.dart';

class EduAndCertWidget extends StatelessWidget {
  const EduAndCertWidget({
    Key key,
  }) : super(key: key);
  final double indicatorSize = 40;
  final double arrowTipVerticalDistanceFromTop = 20;

  @override
  Widget build(BuildContext context) {
    return StepperWidget(
      indicatorSize: indicatorSize,
      indicatorPaddingTop: arrowTipVerticalDistanceFromTop,
      gutterSpacing: 20,
      lineGap: 0,
      indicators: [
        ImageIndicatorWidget(
          size: indicatorSize,
          imageSrc: "images/graduate-cap.png",
          imagePadding: 10,
        ),
        ImageIndicatorWidget(
          size: indicatorSize,
          imageSrc: "images/graduate-cap.png",
          imagePadding: 10,
        ),
      ],
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: arrowTipVerticalDistanceFromTop +
                        (indicatorSize - (14 + 3 + 3)) / 2),
                child: TimeRangeWidget(
                  yearStart: 2020,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: EmploymentBubbleWidget(
                indicatorSize: indicatorSize,
                arrowTipVerticalDistanceFromTop:
                    arrowTipVerticalDistanceFromTop,
                workPosition: 'JLPT N3 Certified',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: arrowTipVerticalDistanceFromTop +
                        (indicatorSize - (14 + 3 + 3)) / 2),
                child: TimeRangeWidget(yearStart: 2013, yearEnd: 2018),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: EmploymentBubbleWidget(
                indicatorSize: indicatorSize,
                arrowTipVerticalDistanceFromTop:
                    arrowTipVerticalDistanceFromTop,
                workPosition:
                    'Bachelor of Applied Science (B.A.Sc.), Information Technology',
                firmName:
                    'Posts and Telecommunications Institute of Technology',
                description: "GPA: 3.11/4",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
