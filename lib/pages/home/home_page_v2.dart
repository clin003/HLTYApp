//import 'package:flutter/material.dart';
//import 'package:app/utils/navigator_util.dart';
//import 'package:app/widgets/v_empty_view.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//// import 'package:app/widgets/widget_play.dart';
//import '../../application.dart';
//import 'discover/discover_page_v2.dart';
//import 'package:app/generated/l10n.dart';
//
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//  TabController _tabController;
//
//  @override
//  void initState() {
//    super.initState();
//    _tabController = TabController(vsync: this, length: 3);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
//      appBar: PreferredSize(
//        child: AppBar(
//          elevation: 0,
//        ),
//        preferredSize: Size.zero,
//      ),
//      backgroundColor: Colors.white,
//      body: SafeArea(
//        bottom: false,
//        child: Stack(
//          children: <Widget>[
//            Padding(
//              child: Column(
//                children: <Widget>[
//                  Stack(
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.symmetric(
//                            horizontal: ScreenUtil().setWidth(150)),
//                        child: TabBar(
//                          labelStyle: TextStyle(
//                              fontSize: 20, fontWeight: FontWeight.bold),
//                          unselectedLabelStyle: TextStyle(fontSize: 14),
//                          indicator: UnderlineTabIndicator(),
//                          controller: _tabController,
//                          tabs: [
//                            Tab(
//                              text: '发现',
//                            ),
//                            Tab(
//                              text: S.of(context).dialogTip,
//                            ),
//                            Tab(
//                              text: '动态',
//                            ),
//                          ],
//                        ),
//                      ),
//                      Positioned(
//                        right: ScreenUtil().setWidth(20),
//                        child: IconButton(
//                          icon: Icon(
//                            Icons.search,
//                            size: ScreenUtil().setWidth(50),
//                            color: Colors.black87,
//                          ),
//                          onPressed: () {
//                            NavigatorUtil.goSearchPage(context);
//                          },
//                        ),
//                      ),
//                    ],
//                  ),
//                  VEmptyView(20),
//                  Expanded(
//                    child: TabBarView(
//                      controller: _tabController,
//                      children: [
//                        DiscoverPage(),
//                        // Text("发现"),
//                        Text("我的"),
//                        Text("事件"),
//                        // MyPage(),
//                        // EventPage(),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              padding: EdgeInsets.only(
//                  bottom:
//                      ScreenUtil().setWidth(80) + Application.bottomBarHeight),
//            ),
//            // PlayWidget(),
//          ],
//        ),
//      ),
//    );
//  }
//}
