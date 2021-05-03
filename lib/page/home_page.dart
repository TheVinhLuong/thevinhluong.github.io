import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/widgets/tab_title_widget.dart';

import 'aboutMe/about_me_page.dart';
final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();


class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _tabIndex = 0;
  NoAnimationTabController _tabCtrl;
  final aboutMePage = AboutMePage();
  
  @override
  void initState() {
    super.initState();
    _tabCtrl = NoAnimationTabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.center,
              child: TabBar(indicatorColor: Colors.black,
                onTap: (index) {
                  setState(() {
                    print("INDDD $index");
                    _tabCtrl.index = index;
                    _tabIndex = index;
                  });
                },
                controller: _tabCtrl,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(child: TabTitleWidget('Snorlax')),
                  Tab(child: TabTitleWidget('Lucario')),
                  Tab(child: TabTitleWidget('Chingling')),
                ],
              ),
            ),
          ),
        ),
        
        body: IndexedStack(
          index: _tabIndex,
          children: [
            aboutMePage,
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}


class NoAnimationTabController extends TabController {
  NoAnimationTabController(
      {int initialIndex = 0,
      @required int length,
      @required TickerProvider vsync})
      : super(initialIndex: initialIndex, length: length, vsync: vsync);

  @override
  void animateTo(int value,
      {Duration duration = kTabScrollDuration, Curve curve = Curves.ease}) {
    super.animateTo(value,
        duration: const Duration(milliseconds: 0), curve: curve);
  }
}
