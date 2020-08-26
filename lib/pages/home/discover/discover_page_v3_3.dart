import 'dart:io';

import 'package:app/apifetch/taobao.tbk.activity.info.get_api.dart';
import 'package:app/application.dart';
import 'package:app/config/home_banner_list.dart';
import 'package:app/config/home_grid_icon_list.dart';
//import 'package:app/models/openapi_response.dart';
import 'package:app/pages/home/discover/discover_goods_list_feed.dart';
import 'package:app/pages/home/discover/discover_goods_list_filter.dart';
import 'package:app/pages/home/discover/discover_goods_list_material.dart';
import 'package:app/pages/upgrade/upgrade_page.dart';
import 'package:app/utils/url_lanch_utils.dart';
import 'package:common_utils/common_utils.dart' as commonUtils;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/utils/log_util.dart';

import 'package:app/utils/navigator_util.dart';

import 'package:app/widgets/widget_banner.dart';

import 'package:app/models/index_home.dart';
import 'package:app/apifetch/home_index_json.dart';

import 'package:app/utils/app_size.dart';
import 'package:app/generated/l10n.dart';

import 'package:app/widgets/widget_lite.dart';

APPIndexRoot _appIndexRoot;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<BannerList> _bannerList = ConfigHomeBannerList.bannerList;
  List<IconList> _iconList = ConfigHomeGridIconList.iconList;
  FindProductMaterial _findProductMaterial = FindProductMaterial();
//  GuessProductList _guessProductList = GuessProductList();

  /// 构建轮播图
  Widget _buildBanner() {
    return (_bannerList != null && _bannerList.length > 0)
        ? CustomBanner(
            _bannerList.map((e) => '${e.pictUrl}').toList(), //?param=540y210
            onTap: (index) {
//              buildshowDialog(context, 'msg:$index');
              LogUtil.v("<DiscoverPage_V2>构建轮播图:$index");
              LogUtil.v("<DiscoverPage_V2>构建轮播图:${_bannerList[index].moreUrl}");
              LogUtil.v("<DiscoverPage_V2>构建轮播图:${_bannerList[index].name}");
              LogUtil.v("<DiscoverPage_V2>构建轮播图:${_bannerList[index].pageId}");
              LogUtil.v(
                  "<DiscoverPage_V2>构建轮播图:${_bannerList[index].urlScheme}");

              if (_bannerList[index].urlScheme == '') {
                NavigatorUtil.goTo(context, '${_bannerList[index].moreUrl}');
              } else {
                UrlLaunchUtils.launchURLWithScheme(
                    '${_bannerList[index].moreUrl}',
                    scheme: _bannerList[index].urlScheme,
                    text: '', errDialog: (e) {
                  buildshowDialog(
                      context,
                      "以下内容已复制，请粘贴至聊天App界面发送或打开\n"
                      "$e");
                });
              }

//             if  ( Application.sp.getBool("banChickUrl")){
//               NavigatorUtil.goTo(context, '${_bannerList[index].moreUrl}');
//             }else{
//               UrlLaunchUtils.launchURLWithScheme(
//                   '${_bannerList[index].moreUrl}',
//                   scheme: _bannerList[index].urlScheme,
//                   text: '', errDialog: (e) {
//                 buildshowDialog(context, "以下内容已复制，请粘贴至聊天App界面发送或打开\n"
//                     "$e");
//               });
//             }
            },
          )
        : Container();
  }

  /// 构建分类列表
  Widget _buildHomeIconList() {
    var width = AppSize.width(100);
    int _crossAxisCount = 5;
    if (_iconList != null && _iconList.length > 5) {
      _crossAxisCount = 5;
    } else if (_iconList != null && _iconList.length > 0) {
      _crossAxisCount = _iconList.length;
    } else {
      return Container();
    }
    return GridView.custom(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount,
        childAspectRatio: 1 / 1.1,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
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
              if (_iconList[index].urlScheme == '') {
                NavigatorUtil.goTo(context, '${_iconList[index].moreUrl}');
              } else {
                UrlLaunchUtils.launchURLWithScheme(
                    '${_iconList[index].moreUrl}',
                    scheme: _iconList[index].urlScheme,
                    text: '', errDialog: (e) {
                  buildshowDialog(
                      context,
                      "以下内容已复制，请粘贴至聊天App输入框发送或打开\n"
                      "$e");
                });
              }
            },
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width / 2),
                          border: Border.all(color: Colors.white70, width: 0.5),
                          gradient: RadialGradient(
                            colors: [
                              Colors.white, // Color(0xFFFF8174),
                              Colors.white,
                            ],
                            center: Alignment(-1.7, 0),
                            radius: 1,
                          ),
                          color: Colors.red),
                    ),
                    (_iconList[index].pictUrl.startsWith('http'))
                        ? Image.network(
                            _iconList[index].pictUrl,
                            width: width,
                            height: width,
                          )
                        : Image.asset(
                            _iconList[index].pictUrl,
                            width: width,
                            height: width,
                          ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: _iconList[index].name == '每日推荐'
                          ? Text(
                              '${commonUtils.DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(''),
                    )
                  ],
                ),
//                VEmptyView(10),
                buildSmallMargin(),
                Text(
                  '${_iconList[index].name}',
                  style: TextStyle(
//                    color: Colors.black87,
                    fontSize: AppSize.sp(28.0),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _iconList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
//                backgroundColor: Color(0x666666),
//          centerTitle: true,
          elevation: 0,
          leading: Icon(CupertinoIcons.home),
          title: Text(
            "${S.of(context).homeTitle}",
            style: TextStyle(fontSize: AppSize.sp(30.0)),
          ),
          actions: [
//            IconButton(
//              icon: Icon(Icons.search),
//              tooltip: "${S.of(context).searchTip}",
//              onPressed: () {
//                NavigatorUtil.goSearchPage(context, data: '');
//              },
//
//            ),
            IconButton(icon: Icon(CupertinoIcons.news),
                tooltip: "${S.of(context).newmsgTip}",
                onPressed: (){
                  NavigatorUtil.goRealTimeMessagePage(context);
                })
          ],
        ),
//        backgroundColor: Colors.white,
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding:
                EdgeInsets.only(left: 0.0, top: 2.0, right: 0.0, bottom: 0.0),
            child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBanner(),
                buildSmallMargin(),
                _buildHomeIconList(),

                (_appIndexRoot == null)
                    ? Container()
                    : buildTitleFsuper(
                        (_findProductMaterial?.catName != null)
                            ? _findProductMaterial.catName
                            : "好券直播", onClickMore: () {
                        NavigatorUtil.goHaoquanzhiboPage(context);
                      }),
                DiscoverMaterialGoodsList(
                    id: (_findProductMaterial?.id != null)
                        ? _findProductMaterial.id
                        : '3756'),

                ///                1、【猫超优质爆款】
                ///                精选天猫超市适合淘客推广单品爆款。
                buildTitleFsuper("猫超1元购凑单", onClickMore: () {
                  NavigatorUtil.goManjianzhePage(context);
                }), //
                DiscoverMaterialGoodsList(id: '27162'),

                ///                1、【实时热销榜】
                ///                特色：淘客渠道每日实时热销爆款，官方数据实时更新。
                ///                数量：每个material_id 同时产出500款商品
                buildTitleFsuper("实时热销榜", onClickMore: () {
                  NavigatorUtil.goShishirexiaoPage(context);
                }), //
                DiscoverMaterialGoodsList(id: '28026'),

                ///              本地化生活
                buildTitleFsuper("本地生活", onClickMore: () {
                  NavigatorUtil.goBendishenghuoPage(context);
//                  NavigatorUtil.goMaterialPage(context,
//                      id: '30443', title: '本地生活-今日爆款', totalResults: 500);
                }), //
                DiscoverMaterialGoodsList(id: '30443'),

                buildMiddleMargin(),
                (_appIndexRoot == null)
                    ? Container()
                    : buildTitleFsuper("热卖榜单(9.9)", onClickMore: () {
                        NavigatorUtil.goJiukuaijiuPage(context);
                      }),
                DiscoverFilterGoodsList(),

//                buildMiddleMargin(),
                (_appIndexRoot == null)
                    ? Container()
                    : buildTitleFsuper("最新更新"),
//                buildSmallMargin(),
                DiscoverFeedGoodsList(),
                buildBigMargin(),
                UpgradePage(),
              ],
            ),
          );
        }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    if (Platform.isIOS) {
      Application.sp.setBool("banChickUrl", true);
    } else {
      Application.sp.setBool("banChickUrl", false);
    }
  }

  @override
  bool get wantKeepAlive => true;

  void loadIndexJsonData() async {
    HomeIndexJsonDio.fetch().then((value) {
      if (value != null) {
        _appIndexRoot = value;
        _loadData();
      }
    });
  }

  void _loadData() async {
    if (_appIndexRoot != null) {
      if (Platform.isIOS) {
        Application.sp.setBool("banChickUrl", _appIndexRoot.banChickUrl);
      }
      if (mounted && !Application.sp.getBool("banChickUrl")) {
        setState(() {
          _bannerList = _appIndexRoot.bannerList;
          if (_appIndexRoot?.iconList != null &&
              _appIndexRoot.iconList.length > 0) {
            _iconList.clear();
            _iconList = _appIndexRoot.iconList;
          }
          _findProductMaterial = _appIndexRoot.findProductMaterial;
        });
        _fetchMoreURL();
      }
    } else {
      loadIndexJsonData();
    }
  }

  //加载生成轮播活动页面链接
  void _fetchMoreURL() async {
    _bannerList.forEach((element) {
      if (element.urlScheme == "taobao:" && element.pageId != "") {
        TbkActivityInfoGetRequestAPI.fetch(element.pageId).then((value) {
          if (value?.code != null && value.code == 0) {
            element.moreUrl = value.data;
            LogUtil.v(
                "_loadData>>_bannerList.forEach(element.moreUrl):${value.data}");
          }
        });
      }
    });
  }
}
