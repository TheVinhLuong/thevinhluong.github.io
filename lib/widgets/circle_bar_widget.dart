import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleBarWidget extends StatelessWidget {
  final int maxScore;
  final int score;

  CircleBarWidget({@required this.maxScore, @required this.score});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var i = 0; i < maxScore; i++) ...[
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: i <= score ? Colors.black : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(
                  10) // use instead of BorderRadius.all(Radius.circular(20))
              ),
        ),
        SizedBox(
          width: 3,
        )
      ]
    ]);
  }
}
