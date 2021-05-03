import 'package:flutter/material.dart';
import 'package:portfolio/page/aboutMe/about_me_page.dart';
import 'package:portfolio/widgets/image_indicator_widget.dart';
import 'package:portfolio/widgets/stepper_widget.dart';

import 'page/home_page.dart';
import 'widgets/bubble_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(0xff343434)),
      home: AboutMePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String response;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubheadWidget(
                    text: "WTF",
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'WTF',
                    style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'WTF',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  StepperWidget(
                    indicatorSize: 28,
                    indicatorPaddingTop: 0,
                    gutterSpacing: 10,
                    lineGap: 0,
                    indicators: [
                      ImageIndicatorWidget(
                        size: 28,
                        imageSrc: "suitcase-with-white-details.png",
                      ),
                      ImageIndicatorWidget(
                        size: 28,
                        imageSrc: "suitcase-with-white-details.png",
                      ),
                      ImageIndicatorWidget(
                        size: 28,
                        imageSrc: "suitcase-with-white-details.png",
                      ),
                    ],
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BubbleWidget(
                            popupDirection: TooltipDirection.left,
                            arrowBaseWidth: 1,
                            arrowLength: 1,
                            arrowTipDistance: 1,
                            arrowTipRadius: 1,
                            borderRadius: 5,
                            borderColor: Colors.grey,
                            borderWidth: 1,
                            child: Container(
                              height: 40,
                              color: Colors.green,
                            )),
                      ),
                      Container(
                        height: 50,
                      ),
                      Container(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SubheadWidget extends StatelessWidget {
  final String text;

  const SubheadWidget({Key key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily: 'RobotoSlab',
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
        Container(
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            height: 3),
      ],
    );
  }
}
