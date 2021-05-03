import 'package:flutter/material.dart';
import 'package:portfolio/misc/strings.dart';
import 'package:portfolio/misc/test_style.dart';
import 'package:portfolio/widgets/time_range_widget.dart';

import '../../../widgets/bubble_widget.dart';
import '../../../widgets/image_indicator_widget.dart';
import '../../../widgets/stepper_widget.dart';
import 'employment_bubble_widget.dart';

class EmploymentHistoryWidget extends StatelessWidget {
  const EmploymentHistoryWidget({
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
          imageSrc: "images/suitcase-with-white-details.png",
          imagePadding: 10,
        ),
        ImageIndicatorWidget(
          size: indicatorSize,
          imageSrc: "images/suitcase-with-white-details.png",
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
                  yearStart: 2019,
                  yearEnd: 2021
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: EmploymentBubbleWidget(
                indicatorSize: indicatorSize,
                arrowTipVerticalDistanceFromTop: arrowTipVerticalDistanceFromTop,
                workPosition: 'Senior Flutter Developer',
                firmName: 'OneID (formerly known as VinID)',
                description: about_me_employment_oneid,
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
                child: TimeRangeWidget(
                    yearStart: 2017,
                    yearEnd: 2019
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: EmploymentBubbleWidget(
                indicatorSize: indicatorSize,
                arrowTipVerticalDistanceFromTop: arrowTipVerticalDistanceFromTop,
                workPosition: 'Android Developer',
                firmName: 'Sun Asterisk (formerly known as Framgia)',
                description: about_me_employment_sun_asterisk,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
