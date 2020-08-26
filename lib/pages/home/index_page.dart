import 'package:app/pages/search/search_page.dart';
import 'package:app/pages/tools/tools_page.dart';

import 'package:app/pages/websocket/websocket_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'discover/discover_page_v3_3.dart';

import 'package:app/pages/search/search_data_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

final List<BottomNavigationBarItem> bottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text("发现")),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), title: Text("工具")),
//  BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("线报"))
//  BottomNavigationBarItem(icon: Icon(CupertinoIcons.news), title: Text("线报"))
//
];

final List<Widget> pages = <Widget>[
  DiscoverPage(),
//  SearchDataPage(),
  SearchPage(),
  ToolsPage(), // WebViewPage(title: '测试',url:'https://www.lyhuilin.com'),
//  MyAccountPage(),
//  WebsocketPage(),
];

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  DateTime lastPopTime;
  String token;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
//    print("--*-- _IndexPageState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.currentIndex,
          onTap: (index) async {
            setState(() {
              this.currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: bottomBar),
      body: _getPageBody(context),
    );
  }

  final pageController = PageController();
  Widget _getPageBody(BuildContext context) {
    return PageView(
      controller: pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(), // 禁止滑动
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
