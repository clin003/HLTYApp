//import 'package:app/pages/home/discover/discover_goods_list_feed.dart';
//import 'package:app/pages/home/discover/discover_goods_list_filter.dart';
//import 'package:app/pages/home/discover/discover_goods_list_material.dart';
//import 'package:common_utils/common_utils.dart' as commonUtils;
//import 'package:flutter/material.dart';
//
//import 'package:app/utils/log_util.dart';
//
//import 'package:app/models/goods.dart';
//import 'package:app/utils/navigator_util.dart';
//
//import 'package:app/widgets/widget_banner.dart';
//
//import 'package:app/models/index_home.dart';
//import 'package:app/apifetch/home_index_json.dart';
//
//import 'package:app/utils/app_size.dart';
//import 'package:app/generated/l10n.dart';
//
//import 'package:app/widgets/widget_lite.dart';
//
//APPIndexRoot _appIndexRoot; //= APPIndexRoot();
//
//class DiscoverPage extends StatefulWidget {
//  @override
//  _DiscoverPageState createState() => _DiscoverPageState();
//}
//
//class _DiscoverPageState extends State<DiscoverPage>
//    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
//  List<BannerList> _bannerList = List();
//  List<IconList> _iconList = List();
//  FindProductMaterial _findProductMaterial = FindProductMaterial();
//  GuessProductList _guessProductList = GuessProductList();
//
//  List<GoodsItem> _goodsList = new List<GoodsItem>();
//
////  bool _isLoading = true;
//
//  /// 构建轮播图
//  Widget _buildBanner() {
//    return (_bannerList != null && _bannerList.length > 0)
//        ? CustomBanner(
//            _bannerList.map((e) => '${e.pictUrl}').toList(), //?param=540y210
//            onTap: (index) {
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:$index");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].moreUrl}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].name}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].pageId}");
////        LogUtil.e("<DiscoverPage_V2>构建轮播图:${bannerList[index].urlScheme}");
//            },
//          )
//        : Container();
//  }
//
//  /// 构建分类列表
//  Widget _buildHomeIconList() {
//    var width = AppSize.width(100);
//    int _crossAxisCount = 5;
//    if (_iconList != null && _iconList.length > 5) {
//      _crossAxisCount = 5;
//    } else if (_iconList != null && _iconList.length > 0) {
//      _crossAxisCount = _iconList.length;
//    } else {
//      return Container();
//    }
//    return GridView.custom(
//      shrinkWrap: true,
//      physics: NeverScrollableScrollPhysics(),
//      padding: EdgeInsets.only(bottom: 10),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: _crossAxisCount,
//        childAspectRatio: 1 / 1.1,
//      ),
//      childrenDelegate: SliverChildBuilderDelegate(
//        (context, index) {
//          return GestureDetector(
//            behavior: HitTestBehavior.translucent,
//            onTap: () {
//              print('object');
//              LogUtil.v("<DiscoverPage_V3>构建分类列表(index):$index");
//              LogUtil.v(
//                  "<DiscoverPage_V3>构建分类列表(moreUrl):${_iconList[index].moreUrl}");
//              LogUtil.v(
//                  "<DiscoverPage_V3>构建分类列表(name):${_iconList[index].name}");
//              LogUtil.v(
//                  "<DiscoverPage_V3>构建分类列表(endTime):${_iconList[index].endTime}");
//              LogUtil.v(
//                  "<DiscoverPage_V3>构建分类列表(urlScheme):${_iconList[index].urlScheme}");
//
////              switch (index) {
////                case 0:
////                  // NavigatorUtil.goDailySongsPage(context);
////                  break;
////                case 2:
////                  // NavigatorUtil.goTopListPage(context);
////                  break;
////              }
////              NavigatorUtil.webViewEx(context,
////                  url: '${_iconList[index].moreUrl}',
////                  title: '${_iconList[index].name}');
//              buildshowDialog(
//                  context,
//                  '${_iconList[index].name}\n'
//                  '未完成');
//            },
//            child: Column(
//              children: <Widget>[
//                Stack(
//                  alignment: Alignment.center,
//                  children: <Widget>[
//                    Container(
//                      width: width,
//                      height: width,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(width / 2),
//                          border: Border.all(color: Colors.white70, width: 0.5),
//                          gradient: RadialGradient(
//                            colors: [
//                              Colors.white, // Color(0xFFFF8174),
//                              Colors.white,
//                            ],
//                            center: Alignment(-1.7, 0),
//                            radius: 1,
//                          ),
//                          color: Colors.red),
//                    ),
////                    Image.asset(
////                      map[keys[index]],
////                      width: width,
////                      height: width,
////                    ),
//                    Image.network(
//                      _iconList[index].pictUrl,
//                      width: width,
//                      height: width,
//                    ),
//                    Container(
//                      padding: EdgeInsets.only(top: 5),
//                      child: _iconList[index].name == '每日推荐'
//                          ? Text(
//                              '${commonUtils.DateUtil.formatDate(DateTime.now(), format: 'dd')}',
//                              style: TextStyle(
//                                  color: Colors.red,
//                                  fontWeight: FontWeight.bold),
//                            )
//                          : Text(''),
//                    )
//                  ],
//                ),
////                VEmptyView(10),
//                buildSmallMargin(),
//                Text(
//                  '${_iconList[index].name}',
//                  style: TextStyle(
////                    color: Colors.black87,
//                    fontSize: AppSize.sp(28.0),
//                  ),
//                ),
//              ],
//            ),
//          );
//        },
//        childCount: _iconList.length,
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return Scaffold(
//        appBar: AppBar(
////                backgroundColor: Color(0x666666),
////          centerTitle: true,
//          elevation: 0,
//          leading: Icon(Icons.home),
//          title: Text(
//            "${S.of(context).homeTitle}",
//            style: TextStyle(fontSize: AppSize.sp(30.0)),
//          ),
//          actions: [
//            IconButton(
//              icon: Icon(Icons.search),
//              tooltip: "${S.of(context).searchTip}",
//              onPressed: () {
//                NavigatorUtil.goSearchPage(context, data: '');
//              },
//            ),
//          ],
//        ),
////        backgroundColor: Colors.white,
//        body: Builder(builder: (context) {
//          return SingleChildScrollView(
//            physics: BouncingScrollPhysics(),
//            padding:
//                EdgeInsets.only(left: 0.0, top: 2.0, right: 0.0, bottom: 0.0),
//            child: Column(
////                  crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                _buildBanner(),
//                buildSmallMargin(),
//                _buildHomeIconList(),
//                (_appIndexRoot == null)
//                    ? Container()
//                    : buildTitleFsuper("好券直播"),
//                buildSmallMargin(),
//                DiscoverMaterialGoodsList(
//                    id: (_findProductMaterial != null &&
//                            _findProductMaterial.id != null &&
//                            _findProductMaterial.id != '')
//                        ? _findProductMaterial.id
//                        : '27160'),
//                buildMiddleMargin(),
//                (_appIndexRoot == null)
//                    ? Container()
//                    : buildTitleFsuper("热卖榜单(9.9)"),
//                buildSmallMargin(),
//                DiscoverFilterGoodsList(),
//                buildMiddleMargin(),
//                (_appIndexRoot == null)
//                    ? Container()
//                    : buildTitleFsuper("最新更新"),
//                buildSmallMargin(),
//                DiscoverFeedGoodsList(),
//              ],
//            ),
//          );
//        }));
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _loadData();
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//
//  void loadIndexJsonData() async {
//    APPIndexRoot entity = await HomeIndexJsonDio.fetch();
//    if (entity != null) {
//      _appIndexRoot = entity;
//      _loadData();
//    }
//  }
//
//  void _loadData() async {
//    if (_appIndexRoot != null) {
//      if (mounted) {
//        setState(() {
//          _bannerList = _appIndexRoot.bannerList;
//          _iconList = _appIndexRoot.iconList;
//          _findProductMaterial = _appIndexRoot.findProductMaterial;
//          _guessProductList = _appIndexRoot.guessProductList;
//        });
//      }
//    } else {
//      loadIndexJsonData();
//    }
//  }
//}
