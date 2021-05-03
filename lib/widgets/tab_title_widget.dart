import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabTitleWidget extends StatelessWidget {
  final String text;

  const TabTitleWidget(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'OpenSans',
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700));
  }
}
