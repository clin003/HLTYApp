import 'package:app/apifetch/haodanku_hot_key_api.dart';
import 'package:app/application.dart';
import 'package:app/config/search_hot_list.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/navigator_util.dart';
import 'package:app/widgets/common_text_style.dart';
import 'package:app/widgets/widget_lite.dart';
import 'package:flutter/material.dart';
import 'package:fsearch/fsearch.dart';
import 'package:fsuper/fsuper.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // with AutomaticKeepAliveClientMixin
  FSearchController _searchController = FSearchController();
  List<String> historySearchList = [];
  List<String> hotSearchList = [];
  String _searchText = '';

//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Application.sp.setStringList("search_history", historySearchList);
    Application.sp.setStringList("search_hot", hotSearchList);
  }

  void loadData() {
//    Application.sp.setString('last_goods_title', 'value');
//  在  DiscoverFeedGoodsList  中存储的短标题
    String _lastGoodsTitle = Application.sp.getString('last_goods_title') ?? "";
    historySearchList = Application.sp.getStringList("search_history") ?? [];
    hotSearchList = Application.sp.getStringList("search_hot") ??
        ConfigSearchList.hotSearchList;
//    if (mounted) {
//      hotSearchList = Application.sp.getStringList("search_hot") ??
//          ConfigSearchList.hotSearchList;
//    }

    if (historySearchList.isEmpty && _lastGoodsTitle != "") {
      if (mounted) {
        historySearchList.add(_lastGoodsTitle);
      }
    }

    HaodankuHotKeyAPI.fetch().then((value) {
      if (value != null && value.isNotEmpty) {
        hotSearchList.clear();
        if (mounted) {
          hotSearchList.addAll(value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "搜索",
          style: TextStyle(fontSize: AppSize.sp(30.0)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 18.0, left: 20.0, right: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSearchTipsTitle(),
            buildSmallMargin(),
            _buildSearchTips(),
            buildBigMargin(),
            _buildSearchWidget(),
            buildBigMargin(),
            _buildHotSearch(),
//            _buildWarp(),
            _buildHistorySearch(),
          ],
        ),
      ),
    );
  }

//  Widget _buildWarp() {
//    return Wrap(
//      alignment: WrapAlignment.start,
//      crossAxisAlignment: WrapCrossAlignment.center,
//      spacing: 6.0,
//      runSpacing: 9.0,
//      children: historySearchList
//          .map((v) => GestureDetector(
//                onTap: () {
//                  _searchText = v;
//                  _searchController.text = v;
//                  _search();
//                },
//                child: Chip(
//                  label: Text(
//                    v,
//                    style: common14TextStyle,
//                  ),
//                  backgroundColor: Color(0xFFf2f2f2),
//                ),
//              ))
//          .toList(),
//    );
//  }

  Widget _buildSearchWidget() {
    return FSearch(
      controller: _searchController,
      height: 36.0,
      margin: EdgeInsets.only(left: 6.0, right: 6.0, top: 3.0, bottom: 3.0),
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0, bottom: 2.0),
      prefixes: [
        const SizedBox(width: 6.0),
        Icon(
          Icons.search,
          size: AppSize.sp(36.0),
        ),
//        const SizedBox(width: 3.0)
      ],
      suffixes: [
        IconButton(
            icon: Icon(
              Icons.clear,
              size: AppSize.sp(36.0),
            ),
            onPressed: () {
              _searchController.text = null;

              /// 移除焦点
              _searchController.clearFocus();
            }),
      ],

      /// Hints
      hints: [
        "输入商品名或粘贴宝贝标题搜索",
        "输入关键词开始搜索",
      ],
      hintStyle: TextStyle(fontSize: AppSize.sp(25.0)),

      /// 开启 hint 交换动画
      hintSwitchEnable: true,

      /// 配置 hint 交换动画类型
      hintSwitchType: FSearchAnimationType.Fade,

      /// 获得焦点时是否停止交换动画 默认情况下，当 FSearch 获得输入焦点， FSearch 会自动暂停 Hint 交换动画；再次获得焦点时，又会自动恢复。
      stopHintSwitchOnFocus: true,

      /// 边角
      corner: FSearchCorner(
        leftTopCorner: 15.0,
        leftBottomCorner: 15.0,
        rightBottomCorner: 15.0,
        rightTopCorner: 15.0,
      ),

      /// 边框宽
      strokeWidth: 1,

      /// 边框颜色
      strokeColor: Colors.grey.withOpacity(0.8),

      /// 边角风格
      cornerStyle: FSearchCornerStyle.round,

      /// 点击键盘搜索时触发
      onSearch: (value) {
        _search();
        NavigatorUtil.goSearchPage(context, data: value);
      },
    );
  }

  // 搜索-记录搜索历史记录
  void _search() {
    _searchText = _searchController.text;
    if (mounted) {
      setState(() {
        if (historySearchList.contains(_searchText))
          historySearchList.remove(_searchText);
        historySearchList.insert(0, _searchText);
        if (historySearchList.length > 10) {
          historySearchList.removeAt(historySearchList.length - 1);
        }
        if (hotSearchList.length > 10) {
          hotSearchList.removeAt(hotSearchList.length - 1);
        }
      });
    }

    Application.sp.setStringList("search_history", historySearchList);
//    NavigatorUtil.goSearchPage(context, data: _searchText);
  }

  Widget _buildSearchTipsTitle() {
    return FSuper(
      text: "三步轻松获得优惠券",
      textAlignment: Alignment.topLeft,
      textWeight: FontWeight.bold,
//      textSize: AppSize.sp(30.0),
    );
//  return Text("data",style: boldTextStyle,textAlign: TextAlign.left,);
  }

  Widget _buildSearchTips() {
    return FSuper(
//      text:"san\n",
//      textStyle: FontStyle.normal,
    textSize: AppSize.sp(25.0),
      spans: [
        TextSpan(children: <InlineSpan>[
          WidgetSpan(
              child: Image.asset(
            'assets/images/icon/search_step1.png',
            width: AppSize.width(28.0),
            height: AppSize.width(28.0),
            fit: BoxFit.fill,
          ))
        ]),
        TextSpan(text: ' 1.进入淘宝    '),
        TextSpan(children: <InlineSpan>[
          WidgetSpan(
              child: Image.asset(
            'assets/images/icon/search_step2.png',
            width: AppSize.width(28.0),
            height: AppSize.width(28.0),
            fit: BoxFit.fill,
          ))
        ]),
        TextSpan(text: ' 2.复制商品标题    '),
        TextSpan(children: <InlineSpan>[
          WidgetSpan(
              child: Image.asset(
            'assets/images/icon/search_step3.png',
            width: AppSize.width(28.0),
            height: AppSize.width(28.0),
            fit: BoxFit.fill,
          ))
        ]),
        TextSpan(text: ' 3.点击搜索查询'),
      ],
    );
  }

  //热门搜索
  Widget _buildHotSearch() {
    return Offstage(
      offstage: hotSearchList.isEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '热搜发现',
                  style: boldTextStyle,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: AppSize.width(20),
            children: hotSearchList
                .map((v) => GestureDetector(
                      onTap: () {
                        _searchText = v;
                        _searchController.text = v;
                        _search();
                        NavigatorUtil.goSearchPage(context, data: v);
                      },
                      child: Chip(
                        label: Text(
                          v,
                          style: common14TextStyle,
                        ),
                        backgroundColor: Color(0xFFf2f2f2),
                      ),
                    ))
                .toList(),
          ),
          buildMiddleMargin(),
//          buildBiggestMargin(),
        ],
      ),
    );
  }

  // 历史搜索
  Widget _buildHistorySearch() {
    return Offstage(
      offstage: historySearchList.isEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '历史记录',
                  style: boldTextStyle,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "确定清空全部历史记录？",
                            style: common14GrayTextStyle,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('取消'),
                              textColor: Colors.red,
                            ),
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  historySearchList.clear();
                                  Application.sp.remove("search_history");
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('清空'),
                              textColor: Colors.red,
                            ),
                          ],
                        );
                      });
                },
              )
            ],
          ),
          Wrap(
            spacing: AppSize.width(20),
            children: historySearchList
                .map((v) => GestureDetector(
                      onTap: () {
                        _searchText = v;
                        _searchController.text = v;
                        _search();
                        NavigatorUtil.goSearchPage(context, data: v);
                      },
                      child: Chip(
                        label: Text(
                          v,
                          style: common14TextStyle,
                        ),
                        backgroundColor: Color(0xFFf2f2f2),
                      ),
                    ))
                .toList(),
          ),
          buildMiddleMargin(),
//          buildBiggestMargin(),
        ],
      ),
    );
  }
}
